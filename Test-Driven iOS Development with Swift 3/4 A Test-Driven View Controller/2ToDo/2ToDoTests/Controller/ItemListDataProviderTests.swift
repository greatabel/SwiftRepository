import XCTest
@testable import _ToDo

extension ItemListDataProviderTests {

    class MockTableView: UITableView {
        var cellGotDequeued = false

        override func dequeueReusableCell(withIdentifier identifier: String
            ,for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        class func mockTableView(withDataSource dataSource: UITableViewDataSource)
            -> MockTableView {
                let mockTableView = MockTableView(
                    frame: CGRect(x: 0, y: 0, width: 320, height: 480),
                    style: .plain)
                mockTableView.dataSource = dataSource
                mockTableView.register(MockItemCell.self,
                                       forCellReuseIdentifier: "ItemCell")
                return mockTableView
        }
    }

    class MockItemCell: ItemCell {
        var catchedItem: ToDoItem?

        override func configCell(with item: ToDoItem) {
            catchedItem = item
        }
    }
}

class ItemListDataProviderTests: XCTestCase {

    var sut: ItemListDataProvider!
    var tableView: UITableView!
    var controller: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController

        _ = controller.view

        tableView = controller.tableView
        tableView.dataSource = sut

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_NumberOfSections_IsTwo() {
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
        
    }

    func test_NumberOfRows_InFirstSection_IsToDoCount() {

        sut.itemManager?.add(ToDoItem(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }

    func test_NumberOfRows_InSecondeSection_IsToDoneCount() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        sut.itemManager?.checkItem(at: 0)

        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        sut.itemManager?.checkItem(at: 0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)

    }

    func test_CellForRow_ReturnsItemCell() {
        sut.itemManager?.add(ToDoItem(title:"Foo"))
        tableView.reloadData()

        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
    }

    func test_CellForRow_DequeuesCellFromTableView() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        mockTableView.reloadData()

        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }

    func test_CellForRow_CallsConfigCell() {
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)
        let item = ToDoItem(title: "Foo")
        sut.itemManager?.add(item)
        mockTableView.reloadData()

        let cell = mockTableView.cellForRow(at: IndexPath(row:0, section: 0)) as! MockItemCell
        XCTAssertEqual(cell.catchedItem, item)

    }

    func test_CellForRow_InSectionTwo_CallsConfigCellWithDoneItem() {
//        let mockTableView = MockTableView()
        let mockTableView = MockTableView.mockTableView(withDataSource: sut)

        sut.itemManager?.add(ToDoItem(title: "Foo"))

        let second = ToDoItem(title: "Bar")
        sut.itemManager?.add(second)
        sut.itemManager?.checkItem(at: 1)
        mockTableView.reloadData()

        let cell = mockTableView
            .cellForRow(at: IndexPath(row: 0, section: 1)) as! MockItemCell
        XCTAssertEqual(cell.catchedItem, second)

    }

    
}

import XCTest
@testable import _ToDo

class ItemListDataProviderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_NumberOfSections_IsTwo() {
        let sut = ItemListDataProvider()
        let tableView = UITableView()
        tableView.dataSource = sut
        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(numberOfSections, 2)
        
    }

    func test_NumberOfRows_InFirstSection_IsToDoCount() {
        let sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        let tableView = UITableView()
        tableView.dataSource = sut

        sut.itemManager?.add(ToDoItem(title: "Foo"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
}

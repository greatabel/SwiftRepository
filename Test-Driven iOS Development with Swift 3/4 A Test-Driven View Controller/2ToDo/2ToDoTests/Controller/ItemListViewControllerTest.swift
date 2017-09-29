import XCTest
@testable import _ToDo

class ItemListViewControllerTest: XCTestCase {

    var sut: ItemListViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ItemListViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

 

    func test_TableView_AfterViewDidLoad_IsNotNil() {
        _ = sut.view
        XCTAssertNotNil(sut.tableView)
    }

    
}

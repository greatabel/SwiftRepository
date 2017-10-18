import XCTest
@testable import _ToDo

class ItemListViewControllerTest: XCTestCase {

    var sut: ItemListViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "ItemListViewController")
        sut = viewController as! ItemListViewController

        _ = sut.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

 

//    func test_TableView_AfterViewDidLoad_IsNotNil() {
//        _ = sut.view
//        XCTAssertNotNil(sut.tableView)
//    }
    func test_TableView_AfterViewDidLoad_IsNotNil() {

        XCTAssertNotNil(sut.tableView)
    }

    func test_LoadingView_SetsTableViewDataSource() {

        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)

    }

    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }

    func test_ItemListViewController_HasAddBarButtonWithSelfAsTarget() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? UIViewController, sut)
    }

    func test_AddItem_PresentsAddItemViewController() {
        XCTAssertNil(sut.presentedViewController)

        guard  let addButton = sut.navigationItem.rightBarButtonItem else {
            XCTFail()
            return 
        }
        guard let action = addButton.action else {
            XCTFail()
            return
        }
        UIApplication.shared.keyWindow?.rootViewController = sut

        sut.performSelector(onMainThread: action,
                            with: addButton,
                            waitUntilDone: true)
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is InputViewController)

        let inputViewController =
            sut.presentedViewController as! InputViewController
        XCTAssertNotNil(inputViewController.titleTextField)
    }


    func testItemListVC_SharesItemManagerWithInputVC() {
        guard let addButton = sut.navigationItem.rightBarButtonItem else
        {
            XCTFail()
            return
        }
        guard let action = addButton.action else {
            XCTFail()
            return
        }
        UIApplication.shared.keyWindow?.rootViewController = sut

        sut.performSelector(onMainThread: action, with: addButton, waitUntilDone: true)
        guard let inputViewController =
            sut.presentedViewController as? InputViewController else
        {
            XCTFail()
            return
        }
        guard let inputItemManager = inputViewController.itemManager else
        {
            XCTFail()
            return
        }
        XCTAssertTrue(sut.itemManager === inputItemManager)
    }

    func test_ViewDidLoad_SetsItemManagerToDataProvider() {
        XCTAssertTrue(sut.itemManager === sut.dataProvider.itemManager)
    }
    
}

import XCTest

class _ToDoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        

        let app = XCUIApplication()
        app.navigationBars["_ToDo.ItemListView"].buttons["Add"].tap()
        
        let titleTextField = app.textFields["Title"]
        titleTextField.tap()
        titleTextField.typeText("a")

        let dateTextField = app.textFields["Date"]
        dateTextField.tap()
        dateTextField.tap()
        dateTextField.typeText("10/22/2017")

        let locationTextField = app.textFields["Location"]
        locationTextField.tap()
        locationTextField.typeText("hubei")
        
        let addressTextField = app.textFields["Address"]
        addressTextField.tap()
        addressTextField.typeText("wuhan")

        let descriptionTextField = app.textFields["Description"]
        descriptionTextField.tap()
        descriptionTextField.typeText("haha")
        app.buttons["Save"].tap()

        XCTAssertTrue(app.tables.staticTexts["a"].exists)
        XCTAssertTrue(app.tables.staticTexts["10/22/2017"].exists)
        XCTAssertTrue(app.tables.staticTexts["wuhan"].exists)

    }
}

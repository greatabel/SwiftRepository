import XCTest
@testable import _ToDo

class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(withIdentifier: "DetailViewController")
            as! DetailViewController
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_HasTitleLabel() {

        XCTAssertNotNil(sut.titleLabel)
    }
    func test_HasDateLabel() {
        XCTAssertNotNil(sut.dateLabel)
    }

    func test_HasLocationLabel() {
        XCTAssertNotNil(sut.locationLabel)
    }

    func test_HasDescriptionLabel() {
        XCTAssertNotNil(sut.descriptionLabel)
    }
}

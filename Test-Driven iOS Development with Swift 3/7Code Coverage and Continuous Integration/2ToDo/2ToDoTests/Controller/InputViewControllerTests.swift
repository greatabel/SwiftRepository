import XCTest
@testable import _ToDo
import CoreLocation

class InputViewControllerTests: XCTestCase {

    var sut: InputViewController!

    var placemark: MockPlacemark!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "InputViewController")
            as! InputViewController
        _ = sut.view
    }
    
    override func tearDown() {
        sut.itemManager?.removeAll()

        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func test_HasTitleTextField() {
        XCTAssertNotNil(sut.titleTextField)
    }

    func test_HasDateTextField() {
        XCTAssertNotNil(sut.dateTextField)
    }

    func test_HasLocationTextField() {
        XCTAssertNotNil(sut.locationTextField)
    }

    func test_HasAddressTextField() {
        XCTAssertNotNil(sut.addressTextField)
    }

    func test_HasDescriptionTextField() {
        XCTAssertNotNil(sut.descriptionTextField)
    }

    func test_HasSaveButton() {
        XCTAssertNotNil(sut.saveButton)
    }

    func test_HasCancelButton() {
        XCTAssertNotNil(sut.cancelButton)
    }

    func test_Save_UsesGeocoderToGetCoordinateFromAddress() {
        let mockSut = MockInputViewController()

        mockSut.titleTextField = UITextField()
        mockSut.dateTextField = UITextField()
        mockSut.locationTextField = UITextField()
        mockSut.addressTextField = UITextField()
        mockSut.descriptionTextField = UITextField()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"

        let timestamp = 1456095600.0
        let date = Date(timeIntervalSince1970: timestamp)

        mockSut.titleTextField.text = "Foo"
        mockSut.dateTextField.text = dateFormatter.string(from: date)
        mockSut.locationTextField.text = "Bar"
        mockSut.addressTextField.text = "武汉市关山大道"
        mockSut.descriptionTextField.text = "Baz"

        let mockGeocoder = MockGeocoder()
        mockSut.geocoder = mockGeocoder

        mockSut.itemManager = ItemManager()

        let dismissExpectation = expectation(description: "Dismiss")

        mockSut.completionHandler = {
            dismissExpectation.fulfill()
        }

        mockSut.save()

//        let mockSut1 = MockInputViewController()
//        mockSut1.titleTextField = UITextField()
//        mockSut1.dateTextField = UITextField()
//        mockSut1.locationTextField = UITextField()
//        mockSut1.addressTextField = UITextField()
//        mockSut1.descriptionTextField = UITextField()
//        mockSut1.titleTextField.text = "again"
//        mockSut1.dateTextField.text = dateFormatter.string(from: date)
//        mockSut1.save()
//        print("@@@@@@@")


        placemark = MockPlacemark()
        let coordinate = CLLocationCoordinate2DMake(30.484633, 114.410421)
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)

        waitForExpectations(timeout: 1, handler: nil)

        let item = mockSut.itemManager?.item(at: 0)

        let testItem = ToDoItem(title: "Foo",
                                itemDescription: "Baz",
                                timestamp: timestamp,
                                location: Location(name: "Bar", coordinate: coordinate))

        XCTAssertEqual(item?.title, testItem.title)

        mockSut.itemManager?.removeAll()
    }

    func test_SaveButtonHasSaveAction() {
        let saveButton: UIButton = sut.saveButton

        guard let actions = saveButton.actions(
            forTarget: sut,
            forControlEvent: .touchUpInside) else {
                XCTFail(); return
        }

        XCTAssertTrue(actions.contains("save"))
    }

    func test_Geocoder_FetchesCoordinates() {
        let geocoderAnswered = expectation(description: "Geocoder")

        CLGeocoder().geocodeAddressString("武汉市关山大道") {
            (placemarks, error) -> Void in

            defer { geocoderAnswered.fulfill() }
            guard error == nil else {
                XCTFail(error!.localizedDescription); return
            }
//            guard let coordinate = placemarks?.first?.location?.coordinate else {
//                XCTFail("No coordinate"); return
//            }

            let coordinate = placemarks?.first?.location?.coordinate

            guard let latitude = coordinate?.latitude else {
                XCTFail()
                return
            }

            guard let longitude = coordinate?.longitude else {
                XCTFail()
                return
            }

            XCTAssertEqual(latitude, 30.484633, accuracy: 0.0001)
            XCTAssertEqual(longitude, 114.410421, accuracy: 0.001)

//            geocoderAnswered.fulfill()
        }

        waitForExpectations(timeout: 1, handler: nil)
    }

    func testSave_DismissesViewController() {
        let mockInputViewController = MockInputViewController()
        mockInputViewController.titleTextField = UITextField()
        mockInputViewController.dateTextField = UITextField()
        mockInputViewController.locationTextField = UITextField()
        mockInputViewController.addressTextField = UITextField()
        mockInputViewController.descriptionTextField = UITextField()
        mockInputViewController.titleTextField.text = "Test Title"
        mockInputViewController.save()
        XCTAssertTrue(mockInputViewController.dismissGotCalled)
    }

    
}
extension InputViewControllerTests {
    class MockGeocoder: CLGeocoder {

        var completionHandler: CLGeocodeCompletionHandler?

        override func geocodeAddressString(
            _ addressString: String,
            completionHandler: @escaping CLGeocodeCompletionHandler) {

            self.completionHandler = completionHandler
        }
    }

    class MockPlacemark : CLPlacemark {

        var mockCoordinate: CLLocationCoordinate2D?

        override var location: CLLocation? {
            guard let coordinate = mockCoordinate else
            { return CLLocation() }

            return CLLocation(latitude: coordinate.latitude,
                              longitude: coordinate.longitude)
        }
    }
}

class MockInputViewController : InputViewController {

    var dismissGotCalled = false
    var completionHandler: (() -> Void)?

    override func dismiss(animated flag: Bool,
                          completion: (() -> Void)? = nil) {

        dismissGotCalled = true
        completionHandler?()
    }
}



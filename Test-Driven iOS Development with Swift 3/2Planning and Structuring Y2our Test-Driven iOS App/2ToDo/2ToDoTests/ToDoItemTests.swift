import XCTest
@testable import _ToDo
import CoreLocation

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func test_Init_WhenGivenTitle_SetsTitle() {
        let item = ToDoItem(title: "Foo")
        XCTAssertEqual(item.title, "Foo", "should set title")
    }

    func test_Init_WhenGivenDescription_SetsDescription() {
        let item = ToDoItem(title: "", itemDescription: "Bar")
        XCTAssertEqual(item.itemDescription, "Bar",
                       "should set itemDescription")
    }

    func test_Init_WhenGivenTimestamp_SetsTimestamp() {
        let item = ToDoItem(title: "", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
    }

    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title:"", location: location)
        XCTAssertEqual(item.location?.name, location.name,
                       "should set location")
    }

    func test_EqualItems_AreEqual() {

        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Foo")
        XCTAssertEqual(first, second)
    }

    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 1.0,
                                                     longitude: 0.0)
        let first = Location(name: "Foo", coordinate: firstCoordinate)
        let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0,
                                                      longitude: 0.0)
        let second = Location(name: "Foo", coordinate: secondCoordinate)
        XCTAssertNotEqual(first, second)
    }

    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 0.0,longitude: 1.0)


        let first = Location(name: "Foo", coordinate: firstCoordinate)
        let secondCoordinate = CLLocationCoordinate2D(latitude: 0.0,
                                                      longitude: 0.0)
        let second = Location(name: "Foo", coordinate: secondCoordinate)
        XCTAssertNotEqual(first, second)
    }

    
}

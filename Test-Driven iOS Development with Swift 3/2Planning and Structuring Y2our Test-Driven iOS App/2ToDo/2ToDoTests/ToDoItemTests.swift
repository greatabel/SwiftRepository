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

    func performNotEqualTestWith(firstName: String,
                                 secondName: String,
                                 firstLongLat: (Double, Double)?,
                                 secondLongLat: (Double, Double)?) {
        var firstCoord: CLLocationCoordinate2D? = nil
        if let firstLongLat = firstLongLat {
            firstCoord = CLLocationCoordinate2D(latitude: firstLongLat.0,
                                                longitude: firstLongLat.1)
        }
        let firstLocation = Location(name: firstName,
                                     coordinate: firstCoord)
        var secondCoord: CLLocationCoordinate2D? = nil
        if let secondLongLat = secondLongLat {
            secondCoord = CLLocationCoordinate2D(latitude: secondLongLat.0,
                                                 longitude: secondLongLat.1)
        }
        let secondLocation = Location(name: secondName,
                                      coordinate: secondCoord)


        XCTAssertNotEqual(firstLocation, secondLocation)
    }


    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        performNotEqualTestWith(firstName: "Foo",
                                secondName: "Foo",
                                firstLongLat: (1.0, 0.0),
                                secondLongLat: (0.0, 0.0))
    }

    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        performNotEqualTestWith(firstName: "Foo",
                                secondName: "Foo",
                                firstLongLat: (0.0, 1.0),
                                secondLongLat: (0.0, 0.0))
    }

    
}

import XCTest
@testable import _ToDo

import CoreLocation

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_WhenGivenCoordinate_SetsCoordinate() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
}

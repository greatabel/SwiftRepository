import XCTest


@testable import Swift_Algorithms_and_Data_Structures

class SortingTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testInsertSort() {
        let sorting = Sorting()
        print(sorting.insertionSort([1,3,2,4]))
    }

    func testBubbleSort() {
        let sorting = Sorting()
        print(sorting.bubbleSort([1,3,4,2]))
    }
    
}

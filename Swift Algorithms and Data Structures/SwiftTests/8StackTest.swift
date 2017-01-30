import XCTest
@testable import Swift_Algorithms_and_Data_Structures


class StackTest: XCTestCase {

    var numberList: Array<Int>!

    override func setUp() {
        super.setUp()
        numberList = [8,7,10,9]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func test_Stack() {
        let newStack: Stack<Int>! = Stack<Int>()

    }

}

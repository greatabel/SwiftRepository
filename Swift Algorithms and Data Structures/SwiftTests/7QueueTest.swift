import XCTest
@testable import Swift_Algorithms_and_Data_Structures


class QueueTest: XCTestCase {

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

    func testDeQueue() {
        let q: Queue<Int>! = buildQueue()
    }

    func buildQueue() -> Queue<Int>! {

        let newQ: Queue<Int>! = Queue<Int>()

        XCTAssert(newQ.count == 0, "new queue instance count is 0")

        for s in numberList {
            newQ.enQueue(key: s)
            print("count is: \(newQ.count)")
        }
        if newQ.count != numberList.count {
            XCTFail("queue build failed")
        }
        return newQ
    }
    
}

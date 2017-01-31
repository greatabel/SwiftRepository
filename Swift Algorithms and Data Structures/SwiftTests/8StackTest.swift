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
        var myStack: Stack<Int>! = Stack<Int>()
        myStack = self.buildStack()
        print("newStack.count= \(myStack.count)")
        if myStack.count == 0 {
            XCTFail("no stack items avaiable..")
        }
        for _ in numberList {
            print("stack count: \(myStack.count)")
            print("pop -> \(myStack.pop())")
        }

        XCTAssertTrue(myStack.isEmpty(), "stack structured not emptied..")

    }

    func buildStack() -> Stack<Int>! {
        let newStack: Stack<Int>! = Stack<Int>()
        //test stack instance
        XCTAssertTrue(newStack.count == 0, "new stack instance not created..")
        //build stack
        for s in numberList {
            print("item: \(s) added..")
            newStack.push(key: s)
        }
        print("stack count is: \(newStack.count)")
        if newStack.count != numberList.count {
            XCTFail("stack build failed..")
            return nil
        }
        return newStack
    }

}

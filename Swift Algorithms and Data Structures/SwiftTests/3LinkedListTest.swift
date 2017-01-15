import XCTest


@testable import Swift_Algorithms_and_Data_Structures

class LinkedListTest: XCTestCase {

    var numberList: Array<Int>!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        numberList = [ 8, 2, 30, 4]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func buildLinkedList() -> LinkedList<Int>! {
        let linkedList: LinkedList<Int> = LinkedList<Int>()

        for number in numberList {
            linkedList.addLink(number)
        }
        linkedList.printAllKeys()

        if(linkedList.count != numberList.count) {
            XCTFail("Link list count doesn't math")
            return nil
        }
        return linkedList
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testPrintAllKeys() {
        let linkedlist: LinkedList<Int> = self.buildLinkedList()
        print("linkAtIndex test: --> \(linkedlist.linkAtIndex(index: 0).key)")
        print("-------test remove --")
        linkedlist.removeLinkAtIndex(index: 1)
        linkedlist.printAllKeys()




    }

    func testReverseLinkedList() {
        let linkedlist: LinkedList<Int> = self.buildLinkedList()
        print("----reverse-----")
        linkedlist.reverseLinkedList()

        print("linkAtIndex test: --> \(linkedlist.linkAtIndex(index: 0).key)")
        linkedlist.printAllKeys()
    }




    
}

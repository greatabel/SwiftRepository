import XCTest


@testable import Swift_Algorithms_and_Data_Structures

class LinkedListTest: XCTestCase {

    var numberList: Array<Int>!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        numberList = [ 1, 20, 300, 4000]
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

    func testRemoveLinkAtIndex() {
        let linkedlist: LinkedList<Int> = self.buildLinkedList()
        print("linkAtIndex test: --> \(linkedlist.linkAtIndex(index: 0).key)")
        print("-------test remove --")
        linkedlist.removeLinkAtIndex(index: 1)
        linkedlist.printAllKeys()
    }

    func testAddLinkAtIndex() {
        let linkedlist: LinkedList<Int> = self.buildLinkedList()
        linkedlist.addLinkAtIndex(key:10, index:1)
        print("---after add ---")
        linkedlist.printAllKeys()
    }

    func testReverseLinkedList() {
        let linkedlist: LinkedList<Int> = self.buildLinkedList()
        print("----reverse-----")
        linkedlist.reverseLinkedList()

        print("linkAtIndex test: --> \(linkedlist.linkAtIndex(index: 0).key)")
        linkedlist.printAllKeys()
    }

    func method_map(_ number: LLNode<Int>) -> Int {
        return number.key + 1
    }
    func testMap() {
        let linkedlist: LinkedList<Int> = self.buildLinkedList()
//        let afterMap_List = linkedlist.map(method_map)
        let afterMap_List = linkedlist.map { node in

            var value: Int!

            //evaluate based on switch
            switch node.key {
            case 0..<5:
                value = node.key * 2
            case 5...10:
                value = node.key * 3
            default:
                value = node.key
            }

            return value


        } //end closure
        print("map-->")
        afterMap_List?.printAllKeys()
    }

    func method_filter(_ number: LLNode<Int>) -> Bool {
        return number.key >= 10
    }

    func testFilter() {
        let linkedlist: LinkedList<Int> = self.buildLinkedList()
//        let afterFilter_List = linkedlist.filter(method_filter)
        guard let afterFilter_List = linkedlist.filter({ node in
            return node.key > 5
        }) else { return }

        print("--after filter--")
        afterFilter_List.printAllKeys()

    }

    func testGeneric() {
        let studentList: LinkedList<Student> = LinkedList<Student>()

        let studentA = Student()
        studentA.name = "abel"
        let studentB = Student()
        studentB.name = "abel1"
        studentList.addLink(studentA)
        studentList.addLink(studentB)
        studentList.printAllKeys()
        print("####:\(studentList.count)")
    }

    




    
}

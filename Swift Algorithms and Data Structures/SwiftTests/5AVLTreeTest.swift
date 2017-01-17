import UIKit
import XCTest


@testable import Swift_Algorithms_and_Data_Structures

class AVLTreeTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
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

    func testCount() {
        let numberList = [1, 2, 3, 5, 234, -20]
        let tree = AVLTree<Int>()
        for number in numberList {
            tree.addNode(key: number)
        }
        XCTAssert(tree.count == numberList.count, "Expected tree's size to be \(numberList.count), got \(tree.count) instead.")
    }

    func buildAVLTree(numberList: Array<Int>) {
        let avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")

        //build the tree list
        for number in numberList {
            print("adding \(number) to avl tree...")
            avlTest.addNode(key: number)
        }

//        traverse the completed tree
        avlTest.traverse()

        //tree balance check
        XCTAssertTrue(avlTest.isTreeBalanced(), "tree is unbalanced..")

    }

}

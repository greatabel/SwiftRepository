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

    //essay documentation - single right rotation - O(n)
    func testAVLEssayExample() {

        let numberList : Array<Int> = [29, 26, 23]

        //build and balance model
        self.buildAVLTree(numberList: numberList)

    }

    func traverseFormula(node: AVLTree<Int>) -> Int {

        let results = node.key! + node.height
        if node.height > 0 && node.key! == results {
            XCTFail("closure update failed..")
        }
        return results
    }

    func testAVLTraverseFunction() {

        let avlTest = self.buildClosureTree()
        print("avlTest.traverse(formula: traverseFormula)---------->")
        //invoke formula function
        avlTest.traverse(formula: traverseFormula)

    }

    func buildClosureTree() -> AVLTree<Int> {


        //test for new instance
        let avlTest: AVLTree<Int> = AVLTree<Int>()
        XCTAssertNotNil(avlTest, "avl instance not created..")


        //provide a balanced list
        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]


        //build the tree list
        for number in numberList {
            print("adding \(number) to avl tree...")
            avlTest.addNode(key: number)
        }
        //tree balance check
        XCTAssertTrue(avlTest.isTreeBalanced(), "tree is unbalanced..")
        return avlTest

    }

    //input for a balanced avl tree - O(log n)
    func testAVLBalancedTree() {

        let numberList : Array<Int> = [8, 5, 10, 3, 12, 9, 6, 16]

        //build and balance model
        self.buildAVLTree(numberList: numberList)

    }


    //input for multiple right rotations - O(n)
    func testAVLRotationRight() {

        let numberList: Array<Int> = [29, 26, 23, 20, 19]

        //build and balance model
        self.buildAVLTree(numberList: numberList)
    }



    //input for multiple left rotations - O(n)
    func testAVLRotationLeft() {

        let numberList: Array<Int> = [19, 20, 23, 26, 29]

        //build and balance model
        self.buildAVLTree(numberList: numberList)

    }



    //input for left and right rotations - 0(n)
    func testAVLRotationLeftAndRight() {

        let numberList: Array<Int> = [19, 20, 21, 26, 16, 12]

        //build and balance model
        self.buildAVLTree(numberList: numberList)

    }

}

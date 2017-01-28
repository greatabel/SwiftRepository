import UIKit
import XCTest

@testable import Swift_Algorithms_and_Data_Structures

class TrieTest: XCTestCase {

    var testTrie: Trie = Trie()

    override func setUp() {
        super.setUp()


        //add words to data structure
        testTrie.addWord(keyword: "Ball")
        testTrie.addWord(keyword: "Balls")
        testTrie.addWord(keyword: "Ballard")
        testTrie.addWord(keyword: "Bat")
        testTrie.addWord(keyword: "Bar")

        // Put setup code here. This method is called before the invocation of each test method in the class.
        XCTAssertNotNil(testTrie, "Trie instance not correctly intialized..")
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

    }

}

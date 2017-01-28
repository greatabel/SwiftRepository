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

    func testFindWithPrefix() {

        let wordList: Array<String>! = testTrie.findWord(keyword: "Ba")
        for word in wordList {
            print("\(word) found in trie..")
        }

    }

    func testFindWithWord() {

        let wordList: Array<String>! = testTrie.findWord(keyword: "Ball")
        for word in wordList {
            print("\(word) found in trie..")
        }

    }

    func testCount() {
         XCTAssert(testTrie.findWord(keyword: "Ba").count == 2, "Expected tree's size to be " +
            "5 , got \(testTrie.findWord(keyword: "Ba").count) instead.")
    }

    //testing false search results
    func testFindNoExist() {
        let keyword: String = "Barstool"
        let wordList: Array<String>! = testTrie.findWord(keyword: keyword)

        if (wordList == nil) {
            print("keyword \(keyword) not found in trie..")
        }

        else {
            for word in wordList {
                print("\(word) found in trie..")
            }
        }
    } //end function

}

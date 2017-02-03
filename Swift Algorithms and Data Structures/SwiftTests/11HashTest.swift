import UIKit
import XCTest


@testable import Swift_Algorithms_and_Data_Structures

class HashTableTest: XCTestCase {

    var listsize: Int!
    var swiftTable: HashTable!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        listsize = 25
        swiftTable = HashTable(capacity: listsize)

        swiftTable.addWord("Wayne","Bishop")
        swiftTable.addWord("Frank", "Smith")
        swiftTable.addWord("Jennifer", "Hobbs")
        swiftTable.addWord("Tim", "Cook")
        swiftTable.addWord("Steve", "Jobs")
        swiftTable.addWord("Wayne", "Bishop") //duplicate value - collision should occur
        swiftTable.addWord("Larry", "Page")
        swiftTable.addWord("Albert", "Einstein")
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

    //test the hash algorithm - add your own value to test
    func testCreateHash() {
        var hashValue: Int!
        hashValue = swiftTable.createHash("Dog")
        XCTAssertNotNil(hashValue, "test failed: no hash value detected..")

        if (hashValue != nil) {
            print("the computed hash value is: \(hashValue)..")
        }
    } //end function

    func testFindWord() {
        print(swiftTable.findWord("Frank",  "Smith")) //found in hash table
        print(swiftTable.findWord("John", "Cervello")) //not found (no collision)
        print(swiftTable.findWord("Andrew",  "Collins")) //not found in hash table (collision detected)
    }

}

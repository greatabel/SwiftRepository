import XCTest
@testable import _FirstDemo

class _FirstDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_NumberOfVowels_WhenPassedDominik_ReturnsThree() {
        let viewController = ViewController()
        let string = "Dominik"
        let numberOfVowels = viewController.numberOfVowels(in: string)
        XCTAssertEqual(numberOfVowels, 3,
                       "should find 3 vowels in Dominik")
//        XCTAssertEqual(numberOfVowels, 4,
//                       "should find 4 vowels in Dominik",
//                       file: "_FirstDemoTests.swift", line: 24)
        
    }
    
}

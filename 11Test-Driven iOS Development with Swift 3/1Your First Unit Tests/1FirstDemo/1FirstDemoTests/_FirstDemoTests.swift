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

    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital() {
        let viewController = ViewController()
        let input           = "this is A test headline"
        let expectedOutput  = "This Is A Test Headline"
        let headline = viewController.makeHeadLine(from: input)
        XCTAssertEqual(headline, expectedOutput)
    }

    func test_MakeHeadline_ReturnsStringWithEachWordStartCapital2() {
        let viewController = ViewController()
        let input           = "Here is another Example"
        let expectedOutput  = "Here Is Another Example"
        let headline = viewController.makeHeadLine(from: input)
        XCTAssertEqual(headline, expectedOutput)
    }

}

import XCTest
@testable import _ToDo

class APIClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Login_UsesExpectedURL() {
        let sut = APIClient()
        let mockURLSession = MockURLSession()
        sut.session = mockURLSession

        let completion = { (token: Token?, error: Error?) in }
//        sut.loginUser(withName:"dasdom",
//                      password: "1234",
//                      completion: completion)
        sut.loginUser(withName:"dasdöm",
                      password: "%&34",
                      completion: completion)


        guard let url = mockURLSession.url else { XCTFail(); return }
        let urlComponents = URLComponents(url: url,
                                          resolvingAgainstBaseURL: true)
        XCTAssertEqual(urlComponents?.host, "awesometodos.com")

        XCTAssertEqual(urlComponents?.path, "/login")

//        XCTAssertEqual(urlComponents?.query,
//                       "username=dasdom&password=1234")
        let allowedCharacters = CharacterSet(
            charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
        guard let expectedUsername = "dasdöm".addingPercentEncoding(
            withAllowedCharacters: allowedCharacters) else { fatalError() }
        guard let expectedPassword = "%&34".addingPercentEncoding(
            withAllowedCharacters: allowedCharacters) else { fatalError() }
        XCTAssertEqual(urlComponents?.percentEncodedQuery,
                       "username=\(expectedUsername)&password=\(expectedPassword)")

    }
    
    
}

extension APIClientTests {
    class MockURLSession: SessionProtocol {
        var url: URL?
        func dataTask(with url: URL,
                      completionHandler comletionHandler: @escaping
        (Data?, URLResponse?, Error?) -> Void)
            -> URLSessionDataTask {
                self.url = url
                return URLSession.shared.dataTask(with: url)
        }
    }

}



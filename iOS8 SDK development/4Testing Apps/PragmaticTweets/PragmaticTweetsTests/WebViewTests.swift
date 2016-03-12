import UIKit
import XCTest
import PragmaticTweets


class WebViewTests: XCTestCase, UIWebViewDelegate {

  var loadedWebViewExpectation: XCTestExpectation?
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
  func testAutomaticWebLoad() {
    if let viewController =
      UIApplication.sharedApplication().windows[0].rootViewController
        as? ViewController {
          viewController.twitterWebView.delegate = self
          loadedWebViewExpectation =
            expectationWithDescription("web view auto-load test")
          waitForExpectationsWithTimeout(5.0, handler: nil)
//          let webViewContents =
//          viewController.twitterWebView.stringByEvaluatingJavaScriptFromString(
//            "document.documentElement.body")
//          XCTAssertNil(webViewContents, "web view content are nil")
    } else {
      XCTFail("could not get root view controller")
    }
  }

  // web view delegate
  func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
    XCTFail("web view load failded")
    loadedWebViewExpectation!.fulfill()
  }

  func webViewDidFinishLoad(webView: UIWebView) {
    if let webViewContnts =
      webView.stringByEvaluatingJavaScriptFromString(
        "document.documentElement.textContent") {
          if webViewContnts != "" {
            loadedWebViewExpectation!.fulfill()
          }
    }
  }


}

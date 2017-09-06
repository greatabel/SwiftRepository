//
//  PragmaticPodcastsUITests.swift
//  PragmaticPodcastsUITests
//
//  Created by Chris Adamson on 7/25/16.
//  Copyright © 2016 Pragmatic Programmers, LLC. All rights reserved.
//

import XCTest

class PragmaticPodcastsUITests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testUI_WhenPlayTapped_UpdatesTitles() {
    let app = XCUIApplication()
    app.buttons["Play"].tap()
    XCTAssertTrue(app.buttons["Pause"].exists)
    XCTAssertTrue(app.staticTexts["CocoaConf001.m4a"].exists)
  }
  
}

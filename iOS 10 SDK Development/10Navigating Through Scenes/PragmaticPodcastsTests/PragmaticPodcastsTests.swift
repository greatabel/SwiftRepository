//
//  PragmaticPodcastsTests.swift
//  PragmaticPodcastsTests
//
//  Created by Chris Adamson on 7/25/16.
//  Copyright © 2016 Pragmatic Programmers, LLC. All rights reserved.
//

import XCTest
@testable import PragmaticPodcasts // chris: this was already imported as @testable
import CoreMedia

class PragmaticPodcastsTests: XCTestCase {
  
  var playerVC : ViewController?
  var startedPlayingExpectation : XCTestExpectation?
  var startedPlayingTimer : Timer?
  
  override func setUp() {
    super.setUp()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let playerVC = storyboard.instantiateViewController(withIdentifier:
      "PlayerViewController") as? ViewController else { return  }
    playerVC.loadViewIfNeeded()
    self.playerVC = playerVC
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testPlayerTitleLabel_WhenURLSet_ShowsCorrectFilename() {
    guard let playerVC = playerVC else {
      XCTFail("Couldn't load player scene")
      return
    }
    XCTAssertEqual("CocoaConf001.m4a", playerVC.titleLabel.text)
  }
  
  func testPlayerPlayPauseButton_WhenPlaying_ShowsPause() {
    guard let playerVC = playerVC else {
      XCTFail("Couldn't load player scene")
      return
    }
    playerVC.handlePlayPauseTapped(self)
    XCTAssertEqual("Pause",
                   playerVC.playPauseButton.title(for: .normal))
  }
  
  // asychronous version
  func testPlayerCurrentTime_WhenPlaying_IsNonZero() {
    guard let playerVC = playerVC else {
      XCTFail("Couldn't set up test")
      return
    }
    startedPlayingExpectation = expectation(description: "player starts playing when tapped")
    startedPlayingTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                               target: self,
                                               selector: #selector(timedPlaybackChecker),
                                               userInfo: nil,
                                               repeats: true)
    playerVC.handlePlayPauseTapped(self)
    waitForExpectations(timeout: 10.0, handler: nil)
  }

  func timedPlaybackChecker(timer: Timer) {
    if let player = playerVC?.player, player.currentTime().seconds > 0 {
      startedPlayingExpectation?.fulfill()
      startedPlayingTimer?.invalidate()
    }
  }
    
}

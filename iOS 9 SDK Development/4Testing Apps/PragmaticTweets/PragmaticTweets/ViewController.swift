//
//  ViewController.swift
//  PragmaticTweets
//
//  Created by Chris Adamson on 10/19/14.
//  Copyright (c) 2014 Pragmatic Programmers, LLC. All rights reserved.
//

import UIKit
import Social

public class ViewController: UIViewController {
  
  @IBOutlet public weak var twitterWebView: UIWebView!


  
  @IBAction func handleTweetButtonTapped(sender: UIButton) {
    if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){ 
      let tweetVC = SLComposeViewController (forServiceType: 
        SLServiceTypeTwitter) 
      tweetVC.setInitialText( 
      "I just finished the first project in iOS 8 SDK Development. #pragsios8") 
      presentViewController(tweetVC, animated: true, completion: nil) 
    } else { 
      print ("Can't send tweet") 
    } 
  }

  override public func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    reloadTweets()
  }

  override public func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  /* stub method imported into the book text. full version is above
  @IBAction func handleTweetButtonTapped(sender: UIButton) {
  }
  */
  
  /* stub method imported into the book text. full version is above
  @IBAction func handleTweetButtonTapped(sender: UIButton) {
    println ("handleTweetButtonTapped")
  }
  */

  func reloadTweets() {
    let url = NSURL (string:"https://www.douban.com/people/greatabel/")
    let urlRequest = NSURLRequest (URL: url!)
    twitterWebView.loadRequest(urlRequest)
  }

}


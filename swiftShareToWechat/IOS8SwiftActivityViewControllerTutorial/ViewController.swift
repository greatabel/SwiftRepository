//
//  ViewController.swift
//  IOS8SwiftActivityViewControllerTutorial
//
//  Created by Arthur Knopper on 24/08/14.
//  Copyright (c) 2014 Arthur Knopper. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var shareButton: UIButton!
  

    var appURL = NSURL(string:"https://itunes.apple.com/app/superboard/id951480740?mt=8");
    var image = UIImage(named: "108X108.png")
  
  @IBAction func shareText(sender: UIButton) {
//    let activityViewController = UIActivityViewController(
//      activityItems: [textField.text as NSString],
//      applicationActivities: nil)
//    
//    presentViewController(activityViewController, animated: true, completion: nil)
    // look for "applicationActivities"
    
    let activityView = UIActivityViewController(
        activityItems: [image!,"WeChat Sharing", appURL!],
//        activityItems: [textField.text as NSString],
        applicationActivities: [WeChatSessionActivity(), WeChatMomentsActivity()])
    self.presentViewController(activityView,
        animated: true,
        completion: nil)
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textField.delegate = self
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


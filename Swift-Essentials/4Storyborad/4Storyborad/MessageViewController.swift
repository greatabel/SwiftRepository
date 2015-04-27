//
//  MessageViewController.swift
//  4Storyborad
//
//  Created by liwei on 15/4/27.
//  Copyright (c) 2015年 greatabel. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    let messages = [
        "Ouch, that hurts",
        "Please don't do that again from Messageview",
        "Why did you press that?",
    ]
    @IBAction func changeMessage() {
        message.text = messages[Int(arc4random_uniform(UInt32(messages.count)))]
    }
    @IBOutlet weak var message: UILabel!
   
    @IBAction func about(sender: AnyObject) {
        performSegueWithIdentifier("about", sender: sender)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "about" {
            let dest = segue.destinationViewController as! UIViewController
            dest.view.backgroundColor = message.backgroundColor
        }
    }
    override func viewDidLoad() {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        message?.backgroundColor = UIColor(
            red:red,
            green:green,
            blue:blue,
            alpha:0.5
        )
    }
}

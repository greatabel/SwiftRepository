//
//  ViewController.swift
//  03Button Fun
//
//  Created by 万畅 on 15/8/21.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        print("\(sender.titleForState(.Normal))")
        
        let title = sender.titleForState(.Normal)
        let plainText = "\(title!) button pressed!"
//         statusLabel.text = plainText
        let styledText = NSMutableAttributedString(string:plainText)
        let attributes = [
            NSFontAttributeName:
            UIFont.boldSystemFontOfSize(statusLabel.font.pointSize)
        ]
        let nameRange = (plainText as NSString).rangeOfString(title!)
        styledText.setAttributes(attributes,range:nameRange)
        
        statusLabel.attributedText = styledText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


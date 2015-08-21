//
//  ViewController.swift
//  03Button Fun
//
//  Created by 万畅 on 15/8/21.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func buttonPressed(sender: AnyObject) {
        print("\(sender.titleForState(.Normal))")
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


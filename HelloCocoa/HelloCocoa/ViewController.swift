//
//  ViewController.swift
//  HelloCocoa
//
//  Created by abel on 15/3/7.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HelloButton: UIButton!
    
    @IBAction func ShowAlert(sender: AnyObject) {
        var alert = UIAlertController(title: "hello!", message: "hello world!",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "CLose", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        self.HelloButton.setTitle("Clicked", forState: UIControlState.Normal)
        
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


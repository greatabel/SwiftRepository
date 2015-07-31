//
//  ViewController.swift
//  HelloCocoa
//
//  Created by abel on 15/3/7.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit
//我修改了class 和 viewDidLoad，didReceiveMemoryWarning为public，是为了XCTest
public class ViewController: UIViewController {

    @IBOutlet weak var HelloButton: UIButton!
    
    @IBAction func ShowAlert(sender: AnyObject) {
        var alert = UIAlertController(title: "hello!", message: "hello world!",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "CLose", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        self.HelloButton.setTitle("Clicked", forState: UIControlState.Normal)
        
    }
    
 public   override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 public   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


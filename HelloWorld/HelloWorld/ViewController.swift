//
//  ViewController.swift
//  HelloWorld
//
//  Created by abel on 15/2/19.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goTapped(sender: AnyObject) {
        helloLabel.text = "hello world from abel 2015-02-19 23:55"
    }
    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


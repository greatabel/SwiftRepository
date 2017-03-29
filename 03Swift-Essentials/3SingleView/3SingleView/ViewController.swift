//
//  ViewController.swift
//  3SingleView
//
//  Created by liwei on 15/4/27.
//  Copyright (c) 2015年 greatabel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        var label = UILabel(frame:view.bounds)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        label.text = "Welcome to Swift from abel!"
        view.addSubview(label)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

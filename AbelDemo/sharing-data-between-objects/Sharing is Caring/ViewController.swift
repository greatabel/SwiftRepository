//
//  ViewController.swift
//  Sharing is Caring
//
//  Created by Jure Zove on 22/04/15.
//  Copyright (c) 2015 Candy Code. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.welcomeLabel.text = SharingManager.sharedInstance.welcomeMessage
    }
}


//
//  DashboardViewController.swift
//  Chapter 3
//
//  Created by Yari D'areglia on 21/06/15.
//  Copyright (c) 2015 Packtpub. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    var username:String?
    
    @IBOutlet weak var usernameLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

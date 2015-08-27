//
//  userHistoryViewController.swift
//  clairvoyant
//
//  Created by 万畅 on 15/8/20.
//  Copyright © 2015年 Luminagic. All rights reserved.
//

import UIKit

class userHistoryViewController: UIViewController {
    var userName : String? = ""
    
    @IBOutlet weak var lblUserName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if userName != ""{
            lblUserName.text = userName
        }
    }
    
    
}

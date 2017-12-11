//
//  BootViewController.swift
//  Chapter 3
//
//  Created by Yari D'areglia on 21/06/15.
//  Copyright (c) 2015 Packtpub. All rights reserved.
//

import UIKit

class BootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindToBoot(_ segue:UIStoryboardSegue){
        if let _ = segue.source as? SignInViewController{
            // Perform Logout operations...
            print("Logout!")
        }
    }

}

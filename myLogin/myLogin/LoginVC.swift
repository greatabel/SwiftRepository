//
//  LoginVC.swift
//  myLogin
//
//  Created by liwei on 15/4/28.
//  Copyright (c) 2015年 greatabel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //
    }
    @IBAction func signinTapped(sender: UIButton) {
        var username:NSString = txtUsername.text
        var password:NSString = txtPassword.text
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }else{
            
            NSLog("Login SUCCESS");
            
            var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            prefs.setObject(username, forKey: "USERNAME")
            prefs.setInteger(1, forKey: "ISLOGGEDIN")
            prefs.synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
}

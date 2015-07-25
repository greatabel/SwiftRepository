//
//  SignupVC.swift
//  ihanhai
//
//  Created by liwei on 15/4/29.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    
    
    @IBOutlet weak var txtPhoneName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!

    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBAction func gotoLogin(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func signupTapped(sender: UIButton) {
        var name:NSString = txtName.text as NSString
        var username:NSString = txtPhoneName.text as NSString
        var password:NSString = txtPassword.text as NSString
        var confirm_password:NSString = txtConfirmPassword.text as NSString
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "注册失败!"
            alertView.message = "请输入用户名和密码"
            alertView.delegate = self
            alertView.addButtonWithTitle("确定")
            alertView.show()
        } else if ( !password.isEqual(confirm_password) ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "注册失败!"
            alertView.message = "密码不匹配"
            alertView.delegate = self
            alertView.addButtonWithTitle("确定")
            alertView.show()
        } else {
            
            registerFunc(name as String,username as String,password as String){
                
                genres in
                let t:NSDictionary = genres
                let v = t["result"] as! String
                NSLog("v1= %@", v)
                if(!v.isEmpty && v=="1"){
                    
                    NSLog("Register SUCCESS");
                    
                    var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                    prefs.setObject(username, forKey: "USERNAME")
                    prefs.setInteger(1, forKey: "ISLOGGEDIN")
                    prefs.synchronize()
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                }else{
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "注册失败!"
                    alertView.message = "手机号已经注册"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("确定")
                    alertView.show()
                }
            
            }
        }
    }
    
    
    

    
    
    
    
}

//
//  LoginVC.swift
//  ihanhai
//
//  Created by liwei on 15/4/29.
//  Copyright (c) 2015年 abel. All rights reserved.
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
        // Dispose of any resources that can be recreated.
    }
    @IBAction func returnTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func signinTapped(sender: UIButton) {
        var username:NSString = txtUsername.text
        var password:NSString = txtPassword.text
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "登录失败!"
            alertView.message = "请输入手机号和密码"
            alertView.delegate = self
            alertView.addButtonWithTitle("确定")
            alertView.show()
        }else{
            NSLog("Login SUCCESS 1");
            
            loginFunc(username as String,password as String){
             
                genres in
                let t:NSDictionary = genres
                let v = t["result"] as! String
                NSLog("t1= %@", v)
                if(!v.isEmpty && v == "1"){
                    
                    NSLog("Login SUCCESS");
                    
                    var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                    prefs.setObject(username, forKey: "USERNAME")
                    prefs.setInteger(1, forKey: "ISLOGGEDIN")
                    prefs.synchronize()
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                }else{
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "登录失败"
                    alertView.message = "用户名密码不匹配"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("确定")
                    alertView.show()
                }
                NSLog("haha:%@", genres)
            }
            
            
            
            //            NSLog("test>>> %@",returnString)
            
            
            
            
            
            
            
            
            
            
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    

}

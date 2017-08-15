//
//  CreateAccountViewController.swift
//  Chapter 3
//
//  Created by Yari D'areglia on 21/06/15.
//  Copyright (c) 2015 Packtpub. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var usernameTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if identifier == "completeRegistration"{
            if usernameTextField.text != "" && passwordTextField.text != "" {
                return true
            }else{
                return false
            }
        }else{
            return true
        }
    }
    
}

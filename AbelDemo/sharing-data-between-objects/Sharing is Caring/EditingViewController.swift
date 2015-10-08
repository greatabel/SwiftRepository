//
//  EditingViewController.swift
//  Sharing is Caring
//
//  Created by Jure Zove on 22/04/15.
//  Copyright (c) 2015 Candy Code. All rights reserved.
//

import UIKit

class EditingViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.textField.text = SharingManager.sharedInstance.welcomeMessage
        self.textField.becomeFirstResponder()
    }
    
    @IBAction func didEndEditing(sender: AnyObject) {
        updateMessageAndDismiss()
    }
    
    @IBAction func changeWelcomeMessage(sender: AnyObject) {
        updateMessageAndDismiss()
    }
    
    func updateMessageAndDismiss() {
        SharingManager.sharedInstance.welcomeMessage = self.textField.text!
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

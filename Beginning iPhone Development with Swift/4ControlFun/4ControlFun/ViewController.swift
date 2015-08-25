//
//  ViewController.swift
//  4ControlFun
//
//  Created by 万畅 on 15/8/24.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var leftSwitch: UISwitch!
    
    @IBOutlet weak var rightSwitch: UISwitch!
    
    @IBOutlet weak var doSomethingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender:UIControl){
     nameField.resignFirstResponder()
     numberField.resignFirstResponder()
    }
    @IBAction func sliderChanged(sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text = "\(progress)"
    }
    
    @IBAction func switchChanged(sender: UISwitch) {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.hidden = false
            rightSwitch.hidden = false
            doSomethingButton.hidden = true
            
            
        }else{
            leftSwitch.hidden = true
            rightSwitch.hidden = true
            doSomethingButton.hidden = false
        }
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let controller = UIAlertController(title: "Are you Sure?", message: nil, preferredStyle: .ActionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'am sure!", style: .Destructive, handler: {
            action in
            let msg = self.nameField.text!.isEmpty  ?
            "You can breathe easey, everything went OK"
            : "You can breathe easey, \(self.nameField.text!   )," + " everything went OK."
        let controller2 = UIAlertController(title: "Something was Done", message: msg, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancelled@^@!!", style: .Cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2, animated: true, completion: nil)
            
        })
        
        let noAction = UIAlertAction(title: "No way!", style: .Cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController{
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        presentViewController(controller, animated: true, completion: nil)
    }
    
    
    
    
    
    
    

}


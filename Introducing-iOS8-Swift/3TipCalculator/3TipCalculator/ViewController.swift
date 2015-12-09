//
//  ViewController.swift
//  3TipCalculator
//
//  Created by abel on 15/2/22.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func calculateTapped(sender: AnyObject) {
        //This code is run each time the Calculate Button is tapped.
        
        var userInput = billTextField.text! as NSString
        var totalBill : Float = userInput.floatValue
        
        var index : Int = tipRateSegmentedControl.selectedSegmentIndex
        var tipRate : Float = 0.15
        
        if index == 0 {
            
            tipRate = 0.15
        } else if index == 1{
            tipRate = 0.20
        }else{
            tipRate = 0.25
        }
        
        var tip = totalBill * tipRate
        
        var display = String(format: "$%.2f", tip)
        
        tipLabel.text = display
        
    }
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipRateSegmentedControl: UISegmentedControl!

    @IBOutlet weak var billTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


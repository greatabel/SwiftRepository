//
//  ViewController.swift
//  1GuessTheNumber
//
//  Created by 万畅 on 15/8/15.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rangeLbl: UILabel!
    @IBOutlet weak var numberTxtField: UITextField!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var numGuessesLbl: UILabel!
    
    @IBAction func onOKPressed(sender: AnyObject){
        
        print(numberTxtField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


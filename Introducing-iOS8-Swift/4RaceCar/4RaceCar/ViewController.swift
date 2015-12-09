//
//  ViewController.swift
//  4RaceCar
//
//  Created by abel on 15/2/24.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var topSpeedLabel: UILabel!
    
    @IBAction func honkTapped(sender: AnyObject) {
    
        //ceate car 
        let myCar = RaceCar()
        
        //Display car
        brandLabel.text = myCar.brand
        colorLabel.text = myCar.color
        topSpeedLabel.text = "\(myCar.topSpeed)"
        
        //Honk car
        myCar.honk()
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


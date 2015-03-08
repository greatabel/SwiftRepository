//
//  ViewController.swift
//  AbelDynamicSnap
//
//  Created by abel on 15/3/8.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func tapped(sender: AnyObject) {
        
        let tap = sender as UITapGestureRecognizer
        let point = tap.locationInView(self.view)
        
        self.dynamicAnimator?.removeBehavior(self.snap)
        self.snap = UISnapBehavior(item: self.imageView, snapToPoint: point)
        self.dynamicAnimator?.addBehavior(self.snap)
    }
    
    var dynamicAnimator:UIDynamicAnimator?
    var snap:UISnapBehavior?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


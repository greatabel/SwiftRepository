//
//  ViewController.swift
//  AbelDynamicGravity
//
//  Created by abel on 15/3/8.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var dynamicAnimator = UIDynamicAnimator()
    
     override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        dynamicAnimator =
            UIDynamicAnimator(referenceView: self.view)
        
        //creating and add a gravity behavior
        let gravityBehavior = UIGravityBehavior(items:[self.imageView])
        dynamicAnimator.addBehavior(gravityBehavior)
        
        //createing and adding a collision behavior
        let collisionBehavior =
            UICollisionBehavior(items: [self.imageView])
        
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
    
        
    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//

}


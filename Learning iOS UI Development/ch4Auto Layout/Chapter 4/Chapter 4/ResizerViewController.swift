//
//  ResizerViewController.swift
//  Chapter 4
//
//  Created by Yari D'areglia on 01/07/15.
//  Copyright (c) 2015 Packtpub. All rights reserved.
//

import UIKit

class ResizerViewController: UIViewController {
    
    struct Constants{
        static let heightForLandscape:CGFloat = 100
        static let heightForPortrait:CGFloat = 400
    }
    
    @IBOutlet var CST_Height:NSLayoutConstraint!
    @IBOutlet var footerView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
       
            
            if UIInterfaceOrientationIsLandscape(toInterfaceOrientation){
                CST_Height.constant = Constants.heightForLandscape
            }else{
                CST_Height.constant = Constants.heightForPortrait
            }
            
            footerView.setNeedsUpdateConstraints()
    }
}

//
//  ContainerViewController.swift
//  AbelSplit
//
//  Created by abel on 15/3/16.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var viewController : UISplitViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func setEmbeddedViewController(splitViewController: UISplitViewController!) {
        if splitViewController != nil{
            viewController = splitViewController
            
            self.addChildViewController(viewController)
            self.view.addSubview(viewController.view)
            viewController.didMoveToParentViewController(self)
            
            self.setOverrideTraitCollection(UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass.Regular), forChildViewController: viewController)
        }
    }
    
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        if size.width > size.height {
            self.setOverrideTraitCollection(UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass.Regular), forChildViewController: viewController)
        } else {
            self.setOverrideTraitCollection(nil, forChildViewController: viewController)
        }
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

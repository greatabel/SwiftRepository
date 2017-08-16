//
//  VFLViewController.swift
//  Chapter 4
//
//  Created by Yari D'areglia on 03/07/15.
//  Copyright (c) 2015 Packtpub. All rights reserved.
//

import UIKit

class VFLViewController: UIViewController {

    let redView = UIView()
    let greenView = UIView()
    var viewsDictionary: [AnyHashable: Any]{
        get {
            return ["redView":self.redView, "greenView":self.greenView]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor(red: 0.95, green: 0.2, blue: 0.0, alpha: 1.0)
        
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = UIColor(red: 0.5, green: 0.80, blue: 0.5, alpha: 1.0)
        
        view.addSubview(redView)
        view.addSubview(greenView)
        
        setupRedView()  // This function sets the red view constraints
        setupGreenView()// This function sets the green view constraints
        
        // This function sets the green view usin a relation to the redView.
        // to try it comment the setupGreenView and use setupGreenView_Relation instead.
        //setupGreenView_Relation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupRedView(){
        
        // Set Size
        let cst_height = NSLayoutConstraint.constraints(
                                withVisualFormat: "V:[redView(100)]",
                                options: NSLayoutFormatOptions(),
                                metrics: nil,
                                views: viewsDictionary as! [String : Any])
        let cst_width = NSLayoutConstraint.constraints(
                                withVisualFormat: "H:[redView(100)]",
                                options: NSLayoutFormatOptions(),
                                metrics: nil,
                                views: viewsDictionary as! [String : Any])
        
        // Set Position
        let cst_Y = NSLayoutConstraint.constraints(
                                withVisualFormat: "V:|-30-[redView]",
                                options: NSLayoutFormatOptions(),
                                metrics: nil,
                                views: viewsDictionary as! [String : Any])
        let cst_X = NSLayoutConstraint.constraints(
                                withVisualFormat: "H:|-30-[redView]",
                                options: NSLayoutFormatOptions(),
                                metrics: nil,
                                views: viewsDictionary as! [String : Any])
        
        // Attach Constraints
        self.redView.addConstraints(cst_height)
        self.redView.addConstraints(cst_width)
        
        self.view.addConstraints(cst_Y)
        self.view.addConstraints(cst_X)

    }
    
    func setupGreenView(){
        
        // Set Size
        let cst_height = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[greenView(100)]",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: viewsDictionary as! [String : Any])
        let cst_width = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[greenView(100)]",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: viewsDictionary as! [String : Any])
        
        // Set Position
        let cst_Y = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[redView]-10-[greenView]",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: viewsDictionary as! [String : Any])
        let cst_X = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[redView]-10-[greenView]",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: viewsDictionary as! [String : Any])
        
        // Attach Constraints
        self.greenView.addConstraints(cst_height)
        self.greenView.addConstraints(cst_width)
        
        self.view.addConstraints(cst_Y)
        self.view.addConstraints(cst_X)
    }
    
    func setupGreenView_Relation(){
        
        // Set Size
        let cst_height = NSLayoutConstraint(
            item: greenView,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: redView,
            attribute: NSLayoutAttribute.height,
            multiplier: 0.5,
            constant: 10.0)
        
        let cst_width = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[greenView(100)]",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: viewsDictionary as! [String : Any])
        
        // Set Position
        let cst_Y = NSLayoutConstraint.constraints(
            withVisualFormat: "V:[redView]-10-[greenView]",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: viewsDictionary as! [String : Any])
        let cst_X = NSLayoutConstraint.constraints(
            withVisualFormat: "H:[redView]-10-[greenView]",
            options: NSLayoutFormatOptions(),
            metrics: nil,
            views: viewsDictionary as! [String : Any])
        
        // Attach Constraints
        self.view.addConstraint(cst_height)
        self.greenView.addConstraints(cst_width)
        
        self.view.addConstraints(cst_Y)
        self.view.addConstraints(cst_X)
    }

}

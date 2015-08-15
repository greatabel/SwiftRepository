//
//  ViewController.swift
//  2Memory
//
//  Created by 万畅 on 15/8/15.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

enum Difficulty{
    case Easy, Mediu, Hard
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



private extension ViewController{
    func setup(){
        
        view.backgroundColor = UIColor.greenSea()
        
        buildButtonCenter(CGPoint(x: view.center.x, y: view.center.y/2.0),
            title: "EASY", color: UIColor.emerald(), action: "onEasyTapped:")
        buildButtonCenter(CGPoint(x: view.center.x, y: view.center.y),
            title: "MEDIUM", color: UIColor.sunflower(), action: "onMediumTapped:")
        buildButtonCenter(CGPoint(x: view.center.x, y: view.center.y*3.0/2.0),
            title: "HARD", color: UIColor.alizarin(), action: "onHardTapped:")
        
        
    }
    func buildButtonCenter(center: CGPoint, title: String, color: UIColor, action: Selector) {
        let button = UIButton()
        button.setTitle(title, forState: .Normal)
        
        button.frame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: 200, height: 50))
        button.center = center
        button.backgroundColor = color
        
        button.addTarget(self, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
    }
}


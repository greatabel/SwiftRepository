//
//  ViewController.swift
//  imageSave
//
//  Created by 万畅 on 16/2/22.
//  Copyright © 2016年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveFunc(sender: AnyObject) {
        print("in saveFunc")
        let image = UIImage(named: "testimage")
        print(image!.size)

    }
    
}


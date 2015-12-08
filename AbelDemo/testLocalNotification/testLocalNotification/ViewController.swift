//
//  ViewController.swift
//  testLocalNotification
//
//  Created by 万畅 on 15/12/8.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func sendNotification(sender: UIButton) {
        print("press send")

        var localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        localNotification.alertBody = "Abel alertbody"
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.applicationIconBadgeNumber =
            UIApplication.sharedApplication().applicationIconBadgeNumber + 1

        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
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


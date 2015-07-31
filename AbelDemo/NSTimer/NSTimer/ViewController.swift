//
//  ViewController.swift
//  NSTimer
//
//  Created by 万畅 on 15/7/31.
//  Copyright (c) 2015年 万畅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    
    var counter = 0
    
    @IBOutlet weak var countingLabel: UILabel!
    
    @IBAction func startButton(sender: AnyObject) {
        
        /*
        TIME_INCREMENT	The number of seconds between firings of the timer. If seconds is less than or equal to 0.0, this method chooses the nonnegative value of 0.1 milliseconds instead. We are going to set this to 1.
        FUNCTION	A function that we will create that will be triggered on the time. We are going to call this updateCounter.
        BOOL	If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires. We are going to set this to yes
        */
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
    }
    
    func updateCounter(){

        countingLabel.text? = String(counter++)
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        
        timer.invalidate()
    }
    
    @IBAction func clearButton(sender: AnyObject) {
        
        timer.invalidate()
        counter = 0
        countingLabel.text? = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countingLabel.text? = String(counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


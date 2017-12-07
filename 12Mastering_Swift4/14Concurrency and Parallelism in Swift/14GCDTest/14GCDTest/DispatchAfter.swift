//
//  DispatchAfter.swift
//  14GCDTest
//
//  Created by 万畅 on 2017/12/7.
//  Copyright © 2017年 luminagic. All rights reserved.
//

import UIKit

class DispatchAfter: NSObject {
    func example() {

        let calculation = DoCalculations()

        let queue2 = DispatchQueue(label: "test")

        let delayInSeconds = 2.0
        let pTime = DispatchTime.now() + Double(Int64(delayInSeconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue2.asyncAfter(deadline: pTime) {
            print("Times Up")
        }

        queue2.sync {
            calculation.performCalculation(100000, tag: "1-------dispatch after sync1")
        }


    }
}

//
//  RaceCar.swift
//  4RaceCar
//
//  Created by abel on 15/2/25.
//  Copyright (c) 2015年 abel. All rights reserved.
//

import UIKit

class RaceCar: NSObject {
   
    //color
    var color : String = "Red"
    
    //top speed
    var topSpeed : Int = 300
    
    var brand : String = "Ferrari"
    
    func honk(){
        println("Honk! from abel")
    }
}

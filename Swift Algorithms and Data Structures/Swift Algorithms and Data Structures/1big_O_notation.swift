//
//  1big_O_notation.swift
//  Swift Algorithms and Data Structures
//
//  Created by 万畅 on 15/11/20.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import Foundation

public class Big_O_Notation {

    let numberList : Array<Int> = [1,2,3,4,5]

    func linearSearch(key:Int) {

        for number in numberList {
            if number == key {
                print("value at \(key) found")
                break
            }
        }
    }
}
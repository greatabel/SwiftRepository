//
//  1big_O_notation.swift
//  Swift Algorithms and Data Structures
//
//  Created by 万畅 on 15/11/20.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import Foundation

public class Big_O_Notation {

    let numberList : Array<Int> = [1,2,3,4,5,6,7,8,9,10]

    func linearSearch(key:Int) {

        for number in numberList {
            if number == key {
                print("value at \(key) found")
                break
            }
        }
    }

    func binarySearch(key: Int, imin: Int, imax: Int) {

        let midIndex : Double = round(Double((imin + imax) / 2 ))
        let midNumber = numberList[Int(midIndex)]

        if midNumber > key {
            binarySearch(key, imin: imin, imax: Int(midIndex) - 1)
        }
        else if (midNumber < key ) {
            binarySearch(key, imin: Int(midIndex) + 1, imax: imax)
        }
        else {
            print("value \(key) found.")
        }

    }
}
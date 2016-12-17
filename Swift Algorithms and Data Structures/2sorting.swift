//
//  2sorting.swift
//  Swift Algorithms and Data Structures
//
//  Created by 万畅 on 15/11/20.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import Foundation

open class Sorting {

    func insertionSort(_ numberList: Array<Int>) -> Array<Int> {
        var numberList = numberList
        var  key : Int
        for x in 0..<numberList.count {
            key = numberList[x]
            for y in (0..<x).reversed() {
//            for (y = x ; y > -1; y -= 1) {
                if (key < numberList[y]) {
                    numberList.remove(at: y + 1)
                    numberList.insert(key, at: y)
                }
            }

        }
        return numberList
    }

    func bubbleSort(_ numberList: Array<Int>) -> Array<Int> {
        
        var numberList = numberList
        var z, passes, key : Int
        for x in 0..<numberList.count {
            passes = (numberList.count - 1) - x;

            for y in 0..<passes {
                key = numberList[y]
                print("comparing \(key) and \(numberList[y+1])")
                if (key > numberList[y+1]) {
                    z = numberList[y + 1]
                    numberList[y + 1] = key
                    numberList[y] = z
                }

            }
        }
        return numberList
    }
    
}

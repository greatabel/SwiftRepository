//
//  2sorting.swift
//  Swift Algorithms and Data Structures
//
//  Created by 万畅 on 15/11/20.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import Foundation

open class Sorting {

    var numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]

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
}

//
//  2sorting.swift
//  Swift Algorithms and Data Structures
//
//  Created by 万畅 on 15/11/20.
//  Copyright © 2015年 abelwan. All rights reserved.
//

import Foundation

public class Sorting {

    var numberList : Array<Int> = [8, 2, 10, 9, 11, 1, 7, 3, 4]

    func insertionSort(var numberList: Array<Int>) -> Array<Int> {
        var y, key : Int
        for x in 0..<numberList.count {
            key = numberList[x]

            for (y = x ; y > -1; y--) {
                if (key < numberList[y]) {
                    numberList.removeAtIndex(y + 1)
                    numberList.insert(key, atIndex: y)
                }
            }

        }
        return numberList
    }
}
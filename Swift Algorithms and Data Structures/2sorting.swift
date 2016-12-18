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

    func selectSort(_ numberList: Array<Int>) -> Array<Int> {
        print("selectSort:--------\n")
        var numberList = numberList

        for x in 0..<numberList.count {
            var minimum = x

//            for y=x+1; y < numberList.count; y += 1 {
            for y in (x+1..<numberList.count) {
                print("comparing \(numberList[minimum])")
                if numberList[minimum] > numberList[y] {
                    minimum = y
                }

            }
            // swap the minimum value with the current array iteration
            print("minimum = \(minimum)")
            let z = numberList[x]
            numberList[x] = numberList[minimum]
            numberList[minimum] = z
        }
        return numberList
    }

    func quickSort(_ hops:[Int]) -> [Int] {
        
        //        var hops = hops
        var hops = hops
        if (hops.count <= 1){
            return hops
        }
        let pivot = hops.remove(at: 0)
        var leftBucket:[Int] = []
        var rightBucket:[Int] = []

//        (hops.count - 1).times { i in
        for i in (0..<hops.count) {
            print("i=\(i)")
            if (hops[i] <= pivot) {
                leftBucket.append(hops[i])
            } else {
                rightBucket.append(hops[i])
            }
        }
        var mergedArray:[Int] = []
        mergedArray += quickSort( leftBucket)
        mergedArray += [pivot]
        mergedArray += quickSort( rightBucket)
        return mergedArray

    }

    func mergeSort(_ input:[Int]) -> [Int] {
        if( input.count <= 1) {
            return input
        }
        // find the mind point 
        let mid = Int(floor(Double(input.count / 2)))
        let left = Array(input[0..<mid])
        let right = Array(input[mid..<input.count])
//        print(mid, left,right)
        let leftSide = mergeSort(left)
        let rightSide = mergeSort(right)
        return sortForMergeSort(left: leftSide, right: rightSide)

    }

    func sortForMergeSort(left:[Int], right:[Int]) -> [Int] {
        print("in sortForMergeSort \(left) \(right)")
        var sortedArray: [Int] = []
        var leftCount = 0
        var rightCount = 0
        for i in (0..<(left.count + right.count)) {
            print("Before i=\(i) \(sortedArray) \(left) \(right)")
            if (leftCount < left.count && (rightCount >= right.count || left[leftCount] <= right[rightCount])) {

                sortedArray.append(left[leftCount])
                leftCount += 1
            } else if (rightCount < right.count && (leftCount >= left.count || right[rightCount] < left[leftCount])) {

                sortedArray.append(right[rightCount])
                rightCount += 1
            }
            print("After i=\(i) \(sortedArray) \(left) \(right)")
        }
        return sortedArray
    }

    
}

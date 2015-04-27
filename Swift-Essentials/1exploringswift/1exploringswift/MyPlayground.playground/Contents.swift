//: Playground - noun: a place where people can play

import UIKit

for i in 1...12 {
    println("i is \(i)")
}

for _ in 1...10{
    println("Looping...")
}

var shopping = [
"Milk",
"Eggs",
"Coffee",
"Tea",
]

var costs = [
    "Milk":1,
    "Eggs":2,
    "Coffee":3,
    "Tea":4,
]

var cost = 0
for item in shopping{
    if let c = costs[item] {
        cost += c
    }
}

println(cost == 10)

Array(costs.keys)
Array(costs.values)

for item in costs{
    println("the \(item)" + "costs\(cost)")
}

// ----function---
func costOf( items:[String], costs:[String:Int]) -> Int{
    var cost = 0
    for item in items{
        if let cm = costs[item]{
            cost += cm
        }
    }
    return cost
}

costOf(shopping, costs) == 10



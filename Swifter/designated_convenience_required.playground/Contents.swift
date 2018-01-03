//: Playground - noun: a place where people can play

import UIKit

class ClassA {
    let numA: Int
    init(num: Int){
        numA = num
    }

    convenience init(bigNum: Bool){
        self.init(num: bigNum ? 10000: 1)
    }
}

class ClassB: ClassA {
    let numB: Int
    override init(num: Int){
        numB = num +  100
        super.init(num: num)
    }
}

var a = ClassA(num: 1)
print(a.numA)
var b = ClassB(num: 2)
print(b.numA, b.numB)

var c = ClassA(bigNum: true)
print(c.numA)
var d = ClassB(bigNum: true)
print(d.numA, d.numB)

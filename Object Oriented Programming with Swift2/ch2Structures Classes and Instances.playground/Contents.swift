//: Playground - noun: a place where people can play

import UIKit

class Circle {
    var  radius: Double
    init(radius: Double) {
        print("I am initializing with radius: \(radius)")
        self.radius = radius
    }
}

var circle1 = Circle(radius: 10)
var circle2 = Circle(radius: 20)
print(circle1.dynamicType)
print(circle2.dynamicType)
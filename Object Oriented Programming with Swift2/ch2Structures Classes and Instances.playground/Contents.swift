//: Playground - noun: a place where people can play

import UIKit

class Circle {
    var  radius: Double
    init(radius: Double) {
        print("I am initializing with radius: \(radius)")
        self.radius = radius
    }

    deinit {
        print("I am deinit")
    }
}

var circle1 = Circle(radius: 10)
var circle2 = Circle(radius: 20)
print(circle1.dynamicType)
print(circle2.dynamicType)

var circleToDelete1 = Circle(radius: 25)
var circleToDelete2 = Circle(radius: 50)
circleToDelete1 = Circle(radius: 32)
circleToDelete2 = Circle(radius: 47)

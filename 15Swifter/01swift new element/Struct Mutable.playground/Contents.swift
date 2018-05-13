//: Playground - noun: a place where people can play

import Cocoa

struct User {
    var age: Int
    var weight: Int
    var height: Int

    mutating func gainWeight(newWeight: Int) {
        weight += newWeight
    }

    func show() {
        print("\(age) \(weight) \(height)")
    }
}

var abel = User(age: 30, weight: 160, height: 172)
abel.show()
abel.gainWeight(newWeight: 5)
abel.show()

//: Playground - noun: a place where people can play

import UIKit

class Cat {
    var name: String
    init() {
        name = "cat"
    }
}

class Tiger: Cat {
    var power: Int
    override init() {
        power = 10
        super.init()
        print("power = \(power)")
        print(name)
        name = "tiger"
        print(name)
    }
}
var t = Tiger()



class TigerWithoutChangeName: Cat {
    var power: Int
    override init() {
        power = 100
    }
}
var w = TigerWithoutChangeName()
print("### \(w.name) \(w.power)")

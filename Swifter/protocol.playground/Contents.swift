//: Playground - noun: a place where people can play

import UIKit

protocol KittenLike {
    func meow() -> String
}

protocol DogLike {
    func bark() -> String
}

protocol TigerLike {
    func aou() -> String
}

class MysteryAnimal: KittenLike, DogLike, TigerLike {
    func meow() -> String {
        return "meow"
    }

    func bark() -> String {
        return "bark"
    }

    func aou() -> String {
        return "aou"
    }
}
var m = MysteryAnimal()
print(m.meow(), m.bark(), m.aou())

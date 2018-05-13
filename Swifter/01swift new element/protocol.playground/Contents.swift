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

// part 2: 不好的实现
protocol PetLike: KittenLike, DogLike {

}

protocol CatLike: KittenLike, TigerLike {

}

struct SoundChecker {
    static func checkPetTalking(pet: PetLike) {
        //...
    }

    static func checkCatTalking(cat: CatLike) {
        //...
    }
}

// part 3: 改进
typealias PetLike_Good = KittenLike & DogLike
typealias CatLike_Good = KittenLike & TigerLike

struct SoundChecker_Good {
    static func checkPetTalking(pet: KittenLike & DogLike) {
        //...
        print(pet.meow(), pet.bark())
    }

    static func checkCatTalking(cat: KittenLike & TigerLike) {
        //...
        print(cat.meow(), cat.aou())
    }
}


SoundChecker_Good.checkPetTalking(pet: m)
SoundChecker_Good.checkCatTalking(cat: m)

// part 4: 多个接口内方法冲突时
protocol A {
    func bar() -> Int
}

protocol B {
    func bar() -> String
}

class ConflictClass: A, B {

    func bar() -> Int {
        return 1000
    }

    func bar() -> String {
        return "Hello world"
    }
}

let instance = ConflictClass()
let num = (instance as A).bar()
let str = (instance as B).bar()
print(num, str)

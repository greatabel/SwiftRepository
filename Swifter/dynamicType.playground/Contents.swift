//: Playground - noun: a place where people can play

import UIKit

class Pet {}
class Cat: Pet {}
class Dog: Pet {}

func printPet(pet: Pet) {
    print("Pet")
}

func printPet(cat: Cat) {
    print("Meow")
}

func printPet(dog: Dog) {
    print("Bark")
}

printPet(cat: Cat())
printPet(dog: Dog())
printPet(pet: Pet())

print("--------")

func printThemA(pet: Pet, _ cat: Cat) {
    print("@@@@@@@@")
    printPet(pet: pet)
    printPet(cat: cat)
}

func printThemB(pet: Pet, _ cat: Cat) {
    print("#######")
    if let aCat = pet as? Cat {
        printPet(cat:aCat)
    } else if let aDog = pet as? Dog {
        printPet(dog:aDog)
    }
    printPet(pet:cat)
}
printThemA(pet: Dog(), Cat())
printThemB(pet: Dog(), Cat())

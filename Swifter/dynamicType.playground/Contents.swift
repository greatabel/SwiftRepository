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

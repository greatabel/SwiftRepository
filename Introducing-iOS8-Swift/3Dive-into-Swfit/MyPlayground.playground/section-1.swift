// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var numberOfYears: Int = 30
var accountBalance: Float = 1203.51
var isStudent: Bool = true
var firstName: String = "Steve"

//var fastCar: Car = Car()

//constants
let name: String = "Constant name abel"
let isMale: Bool = true

var favoriteFood: String = "Pasta"
favoriteFood = favoriteFood.uppercaseString

var beach = "Beach"beach = beach + "Ball"

beach

let name1 = "Steve"
var message = "Hello \(name1)"

//variables in Strings
let seatsPerRow = 25let numberOfRows = 15var seatsString = "In the theater, there are \(numberOfRows) rows and \(seatsPerRow) seats in each row."

//Arrays
var names: [String]=["steve","jeff","andy"]
//because Swift can detet type of a given array,so I can write like:
var names1 = ["haha","hehe"]

//Dictionary
var homeruns : [String: Int] = ["Posey": 24,"Pagan":19,"Pence":15]
var homeruns1 = ["Posey": 24,"Pagan":19,"Pence":15]

var favStates = ["California", "New York", "Colorado", "Oregon"]

for state in favStates {
    var message = "\(state) is my favorite state"
    println(message)
}

var translatedWord : String? = nil


if translatedWord == nil {
    var myMessage = "Good Morning"
} else {
    var myMessage = translatedWord!
}






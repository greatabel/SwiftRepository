// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func  sumNumbers(numbers: Int...) -> Int{
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

let sum = sumNumbers(1,2,3,4,5,6)
println(sum)

func  firstFunction(){
    println("Hello test")
}
firstFunction()

func secondFunction() -> Int{
    return 12345
}
secondFunction()

func  thirdFunction(firstValue: Int , secondValue: Int) -> Int{
    
    return firstValue + secondValue + 1000
}

thirdFunction(10, 90)


func fourthFunction(firstValue: Int, secondValue: Int) ->
    (doubled: Int, quadrupled: Int) {    return (firstValue * 2, secondValue * 4)}
fourthFunction(1, 25)


func addNumbers(firstNumber num1: Int ,secondNumber num2: Int ) ->Int{
    return num1 + num2
}
addNumbers(firstNumber: 10, secondNumber: 90)

//define internal and external
func multipleNumbers(#firstNumber : Int, #secondNumber : Int) -> Int{
    return firstNumber * secondNumber
}
multipleNumbers(firstNumber: 10, secondNumber: 20)



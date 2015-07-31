// Playground - noun: a place where people can play

import Cocoa

func multiplyNumbers2 (firstNumber: Int, multiplier: Int = 2) -> Int { return firstNumber * multiplier;}// Parameters with default values can be omitted multiplyNumbers2(2) // = 4

func swapValue(inout firstValue: Int, inout secondValue: Int) {
    
    let tempValue = firstValue
    firstValue = secondValue
    secondValue = tempValue
}

var swap1 = 1
var swap2 = 2
println((swap1,swap2))
swapValue(&swap1, &swap2)

println((swap1,swap2))


var Func: ( Int, Int) -> Int;

Func = multiplyNumbers2
Func(25, 4)

func timesThree( number: Int) -> Int{
    return number * 3
}

func doSomethingToNumber(aNumber: Int ,doSomething: (Int)->Int) ->Int{
    return doSomething(aNumber)
}

doSomethingToNumber(400, timesThree)


func createAdder(numberToAdd: Int) -> (Int) -> Int {
    func adder(number: Int) -> Int {    return number + numberToAdd
    }    return adder
}
    var addTwo = createAdder(20)

println(addTwo(80))
println(addTwo(180))

// = 4



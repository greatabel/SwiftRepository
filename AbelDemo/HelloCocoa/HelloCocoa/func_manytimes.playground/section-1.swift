// Playground - noun: a place where people can play

import Cocoa

func createIncrementor(incrementAmount: Int) -> () -> Int{
    var amount = 0
    func incrementor() -> Int{
      amount += incrementAmount
      return amount
    }
    return incrementor
}

var incrementBy10 = createIncrementor(10)
incrementBy10()
incrementBy10()

var incrementBy20 = createIncrementor(20)
incrementBy20()
incrementBy20()
incrementBy20()



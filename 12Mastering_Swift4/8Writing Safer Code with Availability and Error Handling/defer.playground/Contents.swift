//: Playground - noun: a place where people can play

import Cocoa

func deferFunction() {
    print("Function start")
    var str: String?

    defer {
        print("In defer block")
        if let s = str {
            print("str is \(s)")
        }
    }
    str = "Test"
    print("Function end")
}

deferFunction()

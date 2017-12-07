//: Playground - noun: a place where people can play

import Cocoa

let clos1 = {
    () in
    print("hello world!")
}

clos1()



let clos2 = {
    (name: String) -> Void in
    print("Hello \(name)")
}

clos2("Abel")


func testClosure(handler: (String) ->Void) {
    handler("Dasher")
}
testClosure(handler: clos2)


let clos3 = {
    (name: String) -> String in
    return "Hello \(name)"
}
print(clos3("Buddy"))


let clos4 = {
    print("Hello from Shorthand version")
}
clos4()

func testFunction(num: Int, handler:()->Void) {
    for _ in 0..<num {
        handler()
    }
}
testFunction(num: 5,handler: clos4)
testFunction(num: 3) {
    print("@-@ Hello from Shorthand version")
}

func testFunction2(num: Int, handler:(_ : String)->Void) {
    for _ in 0..<num {
        handler("Me")
    }
}
testFunction(num: 3) {
    print("#^# Hello from Shorthand version")
}


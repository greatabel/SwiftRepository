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


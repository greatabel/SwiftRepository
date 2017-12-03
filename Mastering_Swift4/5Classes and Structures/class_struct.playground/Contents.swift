//: Playground - noun: a place where people can play

import Cocoa

struct MyStruct {
    let c = 5
    var v = ""
}

class MyClass {
    let c = 5
    var v = ""
}

var myStruct = MyStruct()
var myClass = MyClass()

var myStruct2 = MyStruct(v: "Howdy")

var x = myClass.c
myClass.v = "Howdy"

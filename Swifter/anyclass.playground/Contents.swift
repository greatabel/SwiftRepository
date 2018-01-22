//: Playground - noun: a place where people can play

import UIKit

class A {

    class func method() {
        print("hello")
    }
}

let typeA:  A.Type = A.self
typeA.method()


let anyClass: AnyClass = A.self
(anyClass as! A.Type).method()


// ----------------------------

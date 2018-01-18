//: Playground - noun: a place where people can play

import UIKit

// “可以判等的类型的判断”

let password = "afkfuv(3"

switch password {
    case "afkfuv(3": print("pass")
    default: print("fail to pass")
}

// “对 Optional 的判断”
let num: Int? = nil
switch  num {
case nil:
    print("is nil")
default:
    print("\(num!) value")
}


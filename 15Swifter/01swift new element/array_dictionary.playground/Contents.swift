//: Playground - noun: a place where people can play

import UIKit

let numbers = [1,2,3,4,5]
// numbers 的类型是 [Int]

let strings = ["hello", "world"]

// 如果想要混合：
let mixed_0: [Any] = [1, "two", 3]



let mixed_1: [CustomStringConvertible] = [10, "twenty", 30]

for obj in mixed_1 {
    print(obj.description)
}

print("< ------ >")
enum IntOrString {
    case IntValue(Int)
    case StringValue(String)
}

let mixed_2 = [IntOrString.IntValue(1),
             IntOrString.StringValue("two"),
             IntOrString.IntValue(3)]

for value in mixed_2 {
    switch value {
    case let .IntValue(i):
        print(i * 2)
    case let .StringValue(s):
        print(s.capitalized)
    }
}

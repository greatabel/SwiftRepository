//: Playground - noun: a place where people can play

import UIKit


for i in 0...3 {
    print(i)
}

let test = "hello The world"
let interval = "a"..."z"
for c in test.characters {
    if !interval.contains(String(c)) {
        print("\(c) 不是小写")
    }
}

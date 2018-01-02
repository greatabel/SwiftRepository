//: Playground - noun: a place where people can play
import UIKit

func sum(input: Int...) -> Int {
    return input.reduce(0, +)
}
var r = sum(input: 1,2,3,4)
print(r)

let name = "Tom"
let date = NSDate()
let string = NSString(format: "Hello %@. Date: %@", name, date)
print(string)

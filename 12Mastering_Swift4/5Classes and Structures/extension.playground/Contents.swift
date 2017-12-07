//: Playground - noun: a place where people can play

import Cocoa

extension String {

    var firstLetter: Character? {
        get {
            return self.first
        }
    }

    func reverse() -> String {
        var reverse = ""
        for letter in self {
            reverse = "\(letter)" + reverse
        }
        return reverse
    }
}


var myString = "Learning Swift is fun"
print(myString.reverse())
print(myString.firstLetter!)


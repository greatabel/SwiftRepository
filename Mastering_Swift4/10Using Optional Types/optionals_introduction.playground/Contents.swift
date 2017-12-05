//: Playground - noun: a place where people can play

import Cocoa

var myString1: String?
var myString2: Optional<String>
var myString3: String?


myString1 = "test"
if myString1 != nil {
    let test:String = myString1!
    print(test)
}

func getName(index: Int) -> String? {
    var names = ["Jon", "Kim", "Kailey", "Kara"]
    if index >= names.count {
        return nil
    } else {
        return names[index]
    }
}

var name = getName(index: 2)
var name2 = getName(index: 5)

func optionalParam(myString: String?) {
    if let _ = myString {
        print("Contains value")
    } else {
        print("Does not contains value")
    }
}

optionalParam(myString: nil)

var tuple1: (one: String, two:Int)?
var tuple2: (one:String, two:Int?)
tuple2 = ("Test", nil)

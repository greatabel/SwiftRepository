//: Playground - noun: a place where people can play

import UIKit

class MyClass {
    let oneYearInSecond: TimeInterval = 365 * 24 * 60 * 60
    var date: NSDate {
        willSet {
            let d = date
            print("即将将日期从 \(d) 设定至 \(newValue)")
        }

        didSet {
            if(date.timeIntervalSinceNow > oneYearInSecond) {
                print("设定的时间太晚")
                date = NSDate().addingTimeInterval(oneYearInSecond)
            }
            print("已经将日期从 \(oldValue) 设定至 \(date)")
        }
    }

    init() {
        date = NSDate()
    }
}

let foo = MyClass()
foo.date = foo.date.addingTimeInterval(10086)
foo.date = foo.date.addingTimeInterval(100000000)


class A {
    var _number: Int = 1
    var number :Int {
        get {
            print("get \(_number)")
            return _number
        }

        set(newVal) {
            print("set \(newVal)")
            _number = newVal
            }
    }
}

class B: A {
    override var number: Int {
        willSet {print("willSet")}
        didSet {print("didSet")}
    }
}
let b = B()
b.number = 0

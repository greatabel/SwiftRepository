import UIKit

class ClassA {
    lazy var str: String = {
        let str = "Hello"
        print("只在首次访问输出")
        return str
    }()
}

var a = ClassA()
for i in 0..<5 {
    print(i)
    a.str
}


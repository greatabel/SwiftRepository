import UIKit

struct MyClassContainer1 {
    class MyClass {
        class func hello() {
            print("1")
        }
    }
}

struct MyClassContainer2 {
    class MyClass {
        class func hello() {
            print("2")
        }
    }
}

MyClassContainer1.MyClass.hello()
MyClassContainer2.MyClass.hello()

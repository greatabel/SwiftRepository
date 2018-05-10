import UIKit

protocol MyProtocol {
    func method()
}

extension MyProtocol {
    func method() {
        print("Called")
    }
}

struct MyStruct: MyProtocol {

}
MyStruct().method()

struct MyStruct0: MyProtocol {
    func method() {
        print("Called in struct")
    }
}
MyStruct0().method()

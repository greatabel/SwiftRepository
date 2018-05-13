import UIKit

class Parent {

    final func method() {
        print("开始配置")
        methodImpl()
        print("结束配置")
    }

    func methodImpl() {
        fatalError("子类必须实现这个fangf")
    }
}

class Child: Parent {
    override func methodImpl() {
        print("儿子我实现了")
    }
}

var c = Child()
c.method()


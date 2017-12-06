//: Playground - noun: a place where people can play

import Cocoa

class TestClass {
    typealias nameClosure = (() -> String)

    var name = "Jon"

    lazy var myClosure: nameClosure =  {
        return self.name
    }

    deinit {
        print("deinitialized")
    }

}

var testClass: TestClass? = TestClass()
//print(testClass!.myClosure())
testClass = nil
print("testClass is gone")

class TestClassOne {
    typealias nameClosure = (() -> String)
    var name = "Jon"
    lazy var myClosure: nameClosure = {
        return self.name
    }
    deinit {
        print("TestClassOne deinitialized")
    }
}

class TestClassTwo {
    func closureExample(handler: TestClassOne.nameClosure) {
        print(handler())
    }
    deinit {
        print("TestClassTwo deinitialized")
    }
}
var testClassOne: TestClassOne? = TestClassOne()
var testClassTwo: TestClassTwo? = TestClassTwo()

testClassTwo?.closureExample(handler: testClassOne!.myClosure)
testClassOne = nil
print("testClassOne is gone")
testClassTwo = nil
print("testClassTwo is gone")


import Foundation

@objc protocol MyProtocol {

    optional var optProperty: String { get }
    optional func doSomething();

    optional func optMethod(i: Int) -> String

}

class MyClass : MyProtocol {

    let  optProperty = "abc"

    func doSomething(){
        println("doSomething()")
    }

    // no error
    func test() -> (){
        println("test")
    }

}

class MyClassA: MyProtocol{

    func  optMethod(i: Int) -> String
    {
        return "I am \(i)"
    }
}

var m  = MyClass()
m.test()
m.doSomething()
println(m.optProperty)

var ma = MyClassA()
println(ma.optMethod(10))

println("------------------")

@objc protocol Optionals {
optional var optProperty: String { get }
optional func optMethod(i: Int) -> String 
}

class ImplementsProperty: Optionals {
let optProperty = "I'm a property!" 
}
class ImplementsMethod: Optionals {
    func optMethod(i: Int) -> String {
    return "I'm a method and was passed \(i)" 
    }
}

var a = ImplementsProperty() 
var b = ImplementsMethod()
println(a.optProperty)
println(b.optMethod(1))
class A{
    var otherClass: B?
}

class B{
    var someProperty: Int = 7
    func someMethod()
    {
        println("someMethod called!")
    }

    subscript(index: Int) -> String {
        get {return "getter for [\(index)] called"}
        set {}
    }
}

var a: A?
if a != nil
{

 if a!.otherClass != nil{
    println(a!.otherClass!.someProperty)
 }
 else{
    println("no property available")
 }

}else{
    println("no property available")
}


a = A()
var b: B?
b = B()
a!.otherClass = b
print(a?.otherClass?.someMethod())

println("可以简化为：")
if let p = a?.otherClass?.someProperty
{
    println(p)
}
else
{
    println("no property available #")
}
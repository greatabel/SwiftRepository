class AClass{
    class func aTypeMethod(){
        println("aTypeMethod is here!")
    }

    class func myMethod() -> String
     {
        aTypeMethod()
     return "myMethod here!"    
    }
}
AClass.aTypeMethod()
var myStr: String = AClass.myMethod()
println("myStr= \(myStr)")

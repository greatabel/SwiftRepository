// http://www.swift-studies.com/blog/2014/6/12/observing-properties-in-swift
class MyClass{

    var myProperty:String{

    //Called before the change
    willSet(newValue){
        println("MyClass.myProperty will change from "+myProperty+" to "+newValue)
    }
    
    //Called after the change
    didSet{
        println("MyClass.myProperty did change from "+oldValue+" to "+myProperty)
    }
    }
    
    //Note any initial change is not observed
    init(){
        myProperty = "First value"
    }
    
}



var myInstance = MyClass()
myInstance.myProperty = "Second value"


var myString:String = "Hello"{ 
    willSet(newValue){
        println("myString will change from "+myString+" to "+newValue)
    }
    didSet{
        println("myString did change from "+oldValue+" to "+myString)
    }
}

myString = "Goodbye"



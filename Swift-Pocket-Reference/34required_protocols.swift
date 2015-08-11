protocol SomeProtocol {
    
    var aWritableProperty: Double { get set}
    var aReadOnlyProperty: Int {get}
    static var aTypeProperty: String { get set }


    func printable() -> String
}

class MyClass : SomeProtocol {
     var aWritableProperty = 1.1
    let  aReadOnlyProperty = 1

    struct StoredTypeProperties {
        static var aTypeProperty: String = "hello world"
    }
    class var aTypeProperty: String {
        get {
            return self.StoredTypeProperties.aTypeProperty 
        }

        set {
            self.StoredTypeProperties.aTypeProperty = newValue
        }
    }

    func printable() -> String {
        return "YES"
    }
}


let st = MyClass()
println("\(st.aWritableProperty) # \(st.aReadOnlyProperty) #\(MyClass.aTypeProperty)")
st.aWritableProperty = 2.2
MyClass.aTypeProperty = "Test"
println("\(st.aWritableProperty) # \(st.aReadOnlyProperty) #\(MyClass.aTypeProperty)")
println(st.printable())

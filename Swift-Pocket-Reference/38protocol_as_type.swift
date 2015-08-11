protocol Printable {
    func printable() -> String
}

protocol Hexable: Printable {
    func asHex() -> String
}

extension  Bool: Hexable {
    func printable() -> String
    {
        return self ? "YES":"NO"
    }

    func asHex() -> String
    {
        return self ? "1": "0"
    }

    func testp()
    {
        println("testp")
    }
}

extension UInt: Hexable {
    
    func asHex() -> String
    {
        var temp = self
        var result = ""
        let digits = Array("0123456789abcdef")

        while(temp > 0){
            result = String(digits[Int(temp & 0x0f)]) + result

            temp >>= 4
        }
        return result

    }

    func printable() -> String
    {
        return "printable# \(self)"
    }

}

var a: Hexable = true
println(a.printable() )
println(a.asHex() )
a = UInt(45) 
println(a.printable() )
println(a.asHex())

println("#######\n")
var ar = [Hexable]() 
ar.append(true)
ar.append(UInt(45))
println(ar[0].asHex()) // returns "1" 
println(ar[1].asHex())

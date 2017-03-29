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

var a = false
println(a.printable())
println(a.asHex())
a.testp()

a = true
println(a.printable())
println(a.asHex())
a.testp()
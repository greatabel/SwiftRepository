protocol Printable {
    func printable() -> String
}

protocol testProtocol {
    func testp();
}

extension  Bool: Printable,testProtocol {
    func printable() -> String
    {
        return self ? "YES":"NO"
    }

    func testp()
    {
        println("testp")
    }
}

var a = false
println(a.printable())
a.testp()
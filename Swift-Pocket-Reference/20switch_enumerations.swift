// http://brettbukowski.github.io/SwiftExamples/examples/enums/

enum TravelClass {
    case First, Business, Economy 
}

var thisTicket = TravelClass.First

switch thisTicket 
{
    case .First:
    println ("Cost is $800")
    case .Business:
    println ("Cost is $550")
    case .Economy:
    println ("Cost is $200")

}

enum Example{
    case A,B,C,D
}
var exmaple = Example.A

switch exmaple {
case .A:
    println("A")
case .B:
    println("B")
case .C:
    println("C")
case .D:
    println("D")
    
}


enum Types {
    case Str(String)
    case Num(Double)
}

var a = Types.Str("hello")
a = .Num(1.0)

switch a {
case .Str(let val):
    print(val)
case .Num(let val):
    print(val)                             // 1.0
}
println("---")


enum Letters: Character {
    case a = "A"
    case b = "B"
    case c = "C"
}
enum Numbers: Int {
    case One = 1, Two, Three, Four, Five
}
var five = Numbers.Five
print(five.rawValue) 

var possibleNum = Numbers(rawValue: 2)!
print(possibleNum == Numbers.Two)   


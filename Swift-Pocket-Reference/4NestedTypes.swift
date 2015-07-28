class A{
    class B
    {
        var i = 0
    }
    var j = B()
    var k = 0
}

var a = A()
var b = A.B()
a.j.i = 2
b.i = 5
println(a.j.i)

class C{
    enum TravelClass
    {
        case First, Second, Third
    }
}
var t = C.TravelClass.First
println(t)


// http://letsswift.com/2014/06/nested-types/
struct BlackjackCard {
    // 嵌套定义枚举型Suit
    enum Suit: Character {
       case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
   }
    // 嵌套定义枚举型Rank
    enum Rank: Int {
       case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
       case Jack, Queen, King, Ace
       struct Values {
           let first: Int, second: Int?
       }
       var values: Values {
        switch self {
        case .Ace:
            return Values(first: 1, second: 11)
        case .Jack, .Queen, .King:
            return Values(first: 10, second: nil)
        default:
            return Values(first: self.rawValue, second: nil)
            }
       }
    }
    // BlackjackCard 的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
    var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
println("theAceOfSpades: \(theAceOfSpades.description)")

// enum TravelClass {
// case First case Business case Economy
// }

enum TravelClass {
case First, Business, Economy }

var thisTicket = TravelClass.First
var thatTicket : TravelClass
thatTicket = .Economy

println((thisTicket == TravelClass.First))
println((thatTicket == TravelClass.Economy))

println(" Raw Member Values ")

// enum AtomicNumber: Int {
// case Hydrogen = 1 case Helium = 2 case Lithium = 3 case Beryllium = 4
// }

enum AtomicNumber: Int {
    
case Hydrogen = 1, Helium, Lithium, Beryllium 

}
println(AtomicNumber.Helium)
println(AtomicNumber.Helium.rawValue)

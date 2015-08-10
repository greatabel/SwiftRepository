
// enum TravelClass {
// case First case Business case Economy
// }

enum TravelClass {

case First, Business, Economy 

}

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

if let r = AtomicNumber(rawValue:3){
    println(r)
    println(r == AtomicNumber.Lithium)
}else{

}

println("Associate values -->")

enum NetworkAddress {
case MAC(String)
case IPv4(UInt8, UInt8, UInt8, UInt8) 
}

var routerAddress = NetworkAddress.IPv4(192, 168, 0, 1)
var dnsServerAddress = NetworkAddress.IPv4(8,8,8,8)
var ethernetIF = NetworkAddress.MAC("00:DE:AD:BE:EF:00")

var someAddress = NetworkAddress.IPv4(192, 168, 0, 1) 
someAddress = NetworkAddress.MAC("00:DE:AD:BE:EF:00") 
someAddress = NetworkAddress.IPv4(10, 10, 0, 1)
switch someAddress
{
case .MAC:
println ("got a MAC address")
case .IPv4:
println ("got an IP address")
}

switch someAddress
{
case let .MAC(theaddress):
    println ("got a MAC address of \(theaddress)")
case let .IPv4(a, b, c, d):
    println ("got an IP address with" +
    "a low octet of \(d)")
}

enum TravelClass {
case First, Business, Economy }
var thisTicket = TravelClass.First
switch thisTicket {
case .First:
println ("Cost is $800")
case .Business:
println ("Cost is $550")
case .Economy:
println ("Cost is $200")
}
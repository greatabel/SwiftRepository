// http://makeapppie.com/2014/08/21/the-swift-swift-tutorial-how-to-use-dictionaries-in-swift/

var cpus: [String:String] =
["BBC Model B":"6502", "Lisa":"68000", "TRS-80":"Z80"]

var cpusA =
["BBC Model B":"6502", "Lisa":"68000", "TRS-80":"Z80"]

println("\(cpus) # \(cpusA)")

var cpusB = [String: String](minimumCapacity: 5)
var pieToppings = [String:Double]()



let toppings = ["Pepperoni":0.25,"Sausage":0.26,"Onions":0.02,"Green Peppers":0.03]
for (myKey,myValue) in toppings {
    println("\(myKey) \t \(myValue)")
}

var moreToppings = ["olives":0.06,"BBQ chicken":0.20]

//获取值
let piePrice:[String:Double] = ["Apple":3.99,"Raspberry":0.35]

let numberOfSlices = 2
if let price = piePrice["Apple"]{
        let extPrice = price * Double(numberOfSlices)
        println("\(numberOfSlices) of Apple Pie is \(extPrice)")
}
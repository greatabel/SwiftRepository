/*
http://stackoverflow.com/questions/24006165/how-do-i-print-the-type-or-class-of-a-variable-in-swift

*/

import Foundation

class PureSwiftClass { }

var myvar0 = NSString() // Objective-C class
var myvar1 = PureSwiftClass()
var myvar2 = 42
var myvar3 = "Hans"

println( "toString(myvar0.dynamicType) -> \(myvar0.dynamicType)")
println( "toString(myvar1.dynamicType) -> \(myvar1.dynamicType)")
println( "toString(myvar2.dynamicType) -> \(myvar2.dynamicType)")
println( "toString(myvar3.dynamicType) -> \(myvar3.dynamicType)")

println( "toString(Int.self)           -> \(Int.self)")
println( "toString((Int?).self         -> \((Int?).self)")
println( "toString(NSString.self)      -> \(NSString.self)")
println( "toString(Array<String>.self) -> \(Array<String>.self)")


func * (left: String, right: Int) -> String {
    return join("", Repeat(count:right, repeatedValue: left))
}
println(" ^-^ " * 10)

var testDistingish = "A"
println(testDistingish.dynamicType)
let someChar: Character = "C"
println(someChar.dynamicType)
// https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Generics.html
func swapTwoInts(inout a: Int, inout b: Int)
{
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
swapTwoInts(&someInt,&anotherInt)
println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(inout a: String, inout b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someStr = "testA"
var anotherStr = "testB"
println("someInt is now \(someStr), and anotherInt is now \(anotherStr)")
swapTwoStrings(&someStr,&anotherStr)
println("someInt is now \(someStr), and anotherInt is now \(anotherStr)")

println("Generic Functions ------>")

func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt_1 = 3
var anotherInt_1 = 107
println("someInt is now \(someInt_1), and anotherInt is now \(anotherInt_1)")
swapTwoValues(&someInt_1, &anotherInt_1)
println("someInt is now \(someInt_1), and anotherInt is now \(anotherInt_1)")
// someInt is now 107, and anotherInt is now 3
 
var someString = "hello"
var anotherString = "world"
println("someInt is now \(someString), and anotherInt is now \(anotherString)")
swapTwoValues(&someString, &anotherString)
println("someInt is now \(someString), and anotherInt is now \(anotherString)")
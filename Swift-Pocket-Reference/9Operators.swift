// no implicit type conversion
var i = 2
var f = 44.4

//下面会出错
// let result = (f / i)

 


let resultRight = ( f / Double(i))

// 重载
func * (left: String, right: Int) -> String {
    if right <= 0 {
        return ""
    }

    var result = left
    for _ in 1..<right {
        result += left
    }

    return result
}

println("a" * 6 )


func +(left: [Int], right: [Int]) -> [Int] { // 1
    var sum = [Int]() // 2
    assert(left.count == right.count, "vector of same length only")  // 3
    for (key, v) in enumerate(left) {
      sum.append(left[key] + right[key]) // 4
    }
    return sum
}

var sumArray1 = [1, 2, 3] + [1, 2, 3]
println(sumArray1)

infix operator ⊕ { associativity left precedence 140 } // 1
func ⊕(left: [Int], right: [Int]) -> [Int] { // 2
    var sum = [Int](count: left.count, repeatedValue: 0)
    assert(left.count == right.count, "vector of same length only")
    for (key, v) in enumerate(left) {
        sum[key] = left[key] + right[key]
    }
    return sum
}
var sumArray = [1, 2, 3] ⊕ [1, 2, 3]
println(sumArray)



infix operator ^^^ {
    associativity right
    precedence 155
}

import Foundation 
func ^^^ (base: Int, power: Int) -> Double
{
    return pow(Double(base), Double(power))
}

let fiveSquared = 5 ^^^ 2
// fiveSquared is now a Double that holds the value 25.0
 
let powerOfZero = 123456 ^^^ 0
// powerOfZero is now a Double that holds the value 1.0
 
let negativeExponent = 10 ^^^ -2
// negativeExponent is now a Double that holds the value 0.01
print("show:\(fiveSquared) \(powerOfZero) \(negativeExponent) \n")
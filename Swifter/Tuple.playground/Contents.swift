import UIKit

func swapMe_OldWay<T>( a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a1 = 10
var b1 = 20
print("1#: \(a1) \(b1)")
swapMe_OldWay(a: &a1, b: &b1)
print("2#: \(a1) \(b1)")

func swapMe_TupleWay<T>(a: inout T, b: inout T) {
    (a, b) = (b, a)
}

swapMe_TupleWay(a: &a1, b: &b1)
print("3#: \(a1) \(b1)")

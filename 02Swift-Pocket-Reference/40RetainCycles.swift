class A {
var otherObject: B? 
}
class B {
var otherObject: A? 
}

var a = A() // retain count for new instance of A set to 1 
var b = B() // retain count for new instance of B set to 1 
a.otherObject = b
// B instance retain count incremented to 2
b.otherObject = a
// A instance retain count incremented to 2


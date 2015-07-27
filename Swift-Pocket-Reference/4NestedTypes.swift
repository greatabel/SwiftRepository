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
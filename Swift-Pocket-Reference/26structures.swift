// http://www.codingexplorer.com/instance-methods-and-type-methods-in-swift/
struct Rect {
var x=0.0,y=0.0,width=0.0,height=0.0

func area() -> Double {
return (width * height) 
}

mutating func embiggenBy(size: Double) {
width += size
height += size 
}

static func areaA(p1:Rect, _ p2: Rect) -> Double {
return p1.width + p2.width
}

static func aTypeMethod(){
    println("aTypeMethod !")
}

}

var r = Rect()
println(r.area())
r.embiggenBy(10)
println(r.area())
println(Rect.areaA(r,r))

println("Type Methods for Structures: \(Rect.aTypeMethod())")

var q = Rect(x:2.0, y:2.0, width:2.0, height:5.0)
println(q.area())
q.embiggenBy(8)
println(q.area())



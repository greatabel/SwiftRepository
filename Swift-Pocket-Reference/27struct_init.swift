struct Rect {

var x, y, width, height: Double

init(_ x: Double, _ y: Double, _ width: Double, _ height: Double)
{
self.x = x
self.y = y 
self.width = width 
self.height = height
}

init() {
self.init(0.0, 0.0, 0.0, 0.0)
 }

}

var q = Rect(0.0, 0.0, 3.0, 4.0)
var r = Rect()


struct Point {
    var x: Int
    var y: Int
     
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}
 
var point1 = Point(x: 0, y: 0)
var point2 = point1
 
point1.x = 10
 
println(point1.x) // Outputs 10
println(point2.x) // Outputs 0
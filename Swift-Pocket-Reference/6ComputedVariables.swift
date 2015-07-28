/*
https://developer.apple.com/library/ios/documentation/
Swift/Conceptual/Swift_Programming_Language/Properties.html#//
apple_ref/doc/uid/TP40014097-CH14-ID259
*/
struct Point{
    var x = 0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)

        }
      
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
        
    }


}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
println("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// demo 2
var badPi: Float{
    return 22.0/7.0
}
let radius : Float = 10.5
let circumference = 2.0 * badPi * radius
println("circumference=(\(circumference))")
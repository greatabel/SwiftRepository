struct Rect
{
    var x = 0.0, y = 0.0 , width = 0.0, height = 0.0

    func area() -> Double{
        return (width * height)
    }

}

func + (left: Rect, right: Rect) -> Rect
{
    return Rect(
         x: min(left.x, right.x),
         y: min(left.y, right.y),
         width:max(left.width, right.width),
         height:max(left.height, right.height)
        )
}

var  a = Rect(x:5, y:5, width:51, height:5)
var b = Rect(x:15, y:115, width:2,height:311)
var c = a + b
println("\(c.x) | \(c.y) | \(c.width) | \(c.height)")

// http://rshankar.com/difference-between-struct-and-class-in-swift/

class Rectangle {
 
var name:String = ""
var length:Double = 0
var breadth:Double = 0
 
    func area() -> Double {
        return length * breadth
    }
 
    func draw() -> String {
        return "Draw rectangle with area \(area()) "
    }
}

let rect = Rectangle()

rect.length = 20
rect.breadth = 10
println(rect.draw())

class Shape {

var name: String = ""

    init(name: String) {
        self.name = name
    }
 
    func area() -> Double {
        return 0
    }
 
    func draw() -> String {
        return "Draw a \(name) with area \(area()) "
    }
}

class Square:Shape {

 init() {
        super.init(name: "MySquare")
    }

var length: Double = 0

    override func area() -> Double {
        return length * length
    }

    override func draw() -> String {
        return "Draw a \(name) with area \(area()) "
    }
}
 
let squr = Square()

squr.length = 5
println(squr.draw())
squr.name = "My Square#"
println(squr.draw())




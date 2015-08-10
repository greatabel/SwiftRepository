class Shape {}

class  Square: Shape {
    
    func describe()
    {
        println("I am a Square")
    }
}

class Circle: Shape {
    func identify(){
        println("I am a Circle")
    }
}

var shapes = [Shape]() 
let sq = Square()
let ci = Circle() 

shapes.append(sq)
shapes.append(ci)

for s in shapes {
switch s {
case let cc as Circle: 
    cc.identify() 
case let ss as Square: 
    ss.describe()
default: 
    break;
} }
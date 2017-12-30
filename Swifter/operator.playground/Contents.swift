import UIKit

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

let v1 = Vector2D(x: 2.0, y: 3.0)
let v2 = Vector2D(x: 8.0, y: 7.0)

let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)


func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

func -(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x - right.x, y: left.y - right.y)
}

let v4 = v1 + v2
let v5 = v1 - v2

// 没有定义过的 需要声明
// https://stackoverflow.com/questions/39036113/swift3-how-to-handle-precedencegroup-now-operator-should-be-declare-with-a-bod/39036905

precedencegroup MyPrecedence {
    associativity: left
//    precedence 160
    higherThan: MultiplicationPrecedence
}

infix operator +*: MyPrecedence



func +* (left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}
var result = v1 +* v2
print(result)

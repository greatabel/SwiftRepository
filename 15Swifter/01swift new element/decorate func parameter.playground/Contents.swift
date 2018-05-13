import UIKit

func incrementor(variable: Int) -> Int {
    return variable + 1
}
var luckyNumberA = 7
incrementor(variable: luckyNumberA)
print(luckyNumberA)

// 下面是错误的，因为vairable 默认是let的
//func incrementorA(variable: Int) -> Int {
//    return ++variable
//}

func incrementorC( variable: inout Int) {
    variable += 1
}

var luckyNumber = 7
incrementorC(variable: &luckyNumber)
print(luckyNumber)


func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(variable: inout Int) -> () {
        variable += addNumber
    }
    return incrementor
}
var t = 1
var result: () = makeIncrementor(addNumber: 10)(&t)
print(t)

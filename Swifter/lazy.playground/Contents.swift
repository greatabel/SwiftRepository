import UIKit

class ClassA {
    lazy var str: String = {
        let str = "Hello"
        print("只在首次访问输出")
        return str
    }()
}

var a = ClassA()
for i in 0..<5 {
    print(i)
    a.str
}

print("------第2部分------")

let data = 1...5
let result = data.map {
    (i: Int) -> Int in
    print("processing \(i)")
    return i * 2
}
print("Prepare to visit")
for i in result {
    print("processed :\(i)")
}
print("end visit")

print("------第3部分------")
let lazy_result = data.lazy.map {
    (i: Int) -> Int in
    print("processing \(i)")
    return i * 2
}
print("准备访问结果")
for i in lazy_result {
    print("操作后结果为 \(i)")
}

print("操作完毕")

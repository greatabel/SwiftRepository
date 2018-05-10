import UIKit

let name = ["王小二","张三","李四","王二小"]

name.forEach{
    switch $0 {
    case let x where x.hasPrefix("王"):
        print("\(x) 姓王")
    default:
        print("hello \($0)")
    }
}

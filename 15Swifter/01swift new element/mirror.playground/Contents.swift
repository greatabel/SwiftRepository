import UIKit

struct Person {
    let name: String
    let age: Int
    let sex: Bool
}

let xiaoMing = Person(name: "XiaoMing", age: 16, sex: true)
let r = Mirror(reflecting: xiaoMing)

print("xiaoMing 是 \(r.displayStyle!)")
print("属性个数:\(r.children.count)")

for property in r.children {
    print("name: \(property.label!) type: \(type(of: property.value))")
}

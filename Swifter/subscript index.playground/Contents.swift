import UIKit

var arr = [1, 2, 3]
print(arr[2])
arr[2] = 20
print(arr[2])

var dic = ["cat":"meow", "goat":"mie"]
print(dic["cat"] ?? "")
dic["cat"] = "miao"
print(dic["cat"] ?? "")

extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }

        set {
            for (index,i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}
print("-----")
arr = [1,2,3,4,5]
print(arr[[0,2,3]])
arr[[0,2,3]] = [-1,-3,-4]
print(arr[[0,2,3]])

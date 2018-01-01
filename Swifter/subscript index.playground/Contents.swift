import UIKit

var arr = [1, 2, 3]
print(arr[2])
arr[2] = 20
print(arr[2])

var dic = ["cat":"meow", "goat":"mie"]
print(dic["cat"] ?? "")
dic["cat"] = "miao"
print(dic["cat"] ?? "")

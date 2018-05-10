import UIKit

let arr = [1,2, 3]

let doubled = arr.map{
    $0 * 2
}
print(doubled)

let num: Int? = 3

print("another way")
let result = num.map {
    $0 * 2
}
print(result)

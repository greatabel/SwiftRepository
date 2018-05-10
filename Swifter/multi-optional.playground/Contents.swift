import UIKit

var aNil: String? = nil

var anotherNil: String?? = aNil
var literalNil: String?? = nil

if let a = anotherNil {
    print("anotherNil")
}

if let b = literalNil {
    print("literalNil")
}

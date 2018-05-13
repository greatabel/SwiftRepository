import UIKit

class Toy {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet: Pet?
}

var xiaoming = Child()
let toyName = xiaoming.pet?.toy?.name
if toyName == nil {

    print("No toy")
} else {
    print("Have toy")
}

extension Toy {
    func play() {
        print("play toy")
    }
}

xiaoming.pet?.toy?.play()
var xiaohong = Child()
let playClosure = { (child: Child) -> ()? in
    child.pet?.toy?.play()
}

if let _: () = playClosure(xiaoming) {
    print("好开心~")
} else {
    print("没有玩具可以玩 :(")
}

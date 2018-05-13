//: Playground - noun: a place where people can play

import UIKit

protocol Vehicle {

    var numberOfWheels : Int { get }
    var color: UIColor { get set }

    mutating func changeColor()

    func show()
}

struct MyCar: Vehicle {
    var numberOfWheels = 4
    var color = UIColor.blue

    mutating func changeColor() {
        color = UIColor.red
    }
    func show()  {
        print("\(numberOfWheels) color: \(color)")
    }
}

var abelCar = MyCar()
abelCar.numberOfWheels = 4
abelCar.show()
abelCar.changeColor()
abelCar.show()


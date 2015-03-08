class Vehicle {    var color: String?    var maxSpeed = 80
        func description() -> String
    {
        return "A \(self.color) vehicle"
    }    func travel()
    {
                println("Traveling at \(maxSpeed) kph")
            }
}

//inheritance

class Car: Vehicle {
            override func description() -> String {
        var description = super.description()
        return description + " which is a car!"
            }
}

var redVehicle = Vehicle()
redVehicle.color = "Red"
redVehicle.maxSpeed = 90
redVehicle.travel()
redVehicle.description()

var mycar = Car()
mycar.maxSpeed = 100
mycar.travel()

mycar.description()


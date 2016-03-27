import UIKit

class Employee {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        print("init \(self.firstName) \(self.lastName)")
    }



    deinit {
        print("In deinit \(self.firstName) | \(self.lastName)")
    }

}


var ep1 = Employee(firstName: "Great", lastName: "Abel")
var ep2 = Employee(firstName: "Bill", lastName: "Gate")
ep1 = Employee(firstName: "", lastName: "")

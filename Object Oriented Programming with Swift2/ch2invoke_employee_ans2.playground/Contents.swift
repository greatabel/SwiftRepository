class Employee {
    var firstName: String
    var lastName: String
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        print("init \(self.firstName) \(self.lastName)")
    }

    convenience init() {
        self.init(firstName: "", lastName: "")
    }

    deinit {
        print("In deinit \(self.firstName) | \(self.lastName)")
    }
    
}

func  invokeEmployeeFunc(firstName: String, lastName: String) -> String {
   let ep = Employee(firstName: firstName, lastName: lastName)
    return ep.firstName + "#" + ep.lastName
}

var result = invokeEmployeeFunc("Great", lastName: "Abel")
print(result)


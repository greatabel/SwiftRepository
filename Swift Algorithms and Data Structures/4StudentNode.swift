import Foundation


class StudentNode {

    var key: Student?
    var next: StudentNode?
}

class Student {
    var name: String = ""


}

extension Student: Equatable{
    static func ==(lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}

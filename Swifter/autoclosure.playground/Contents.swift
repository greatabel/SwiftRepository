import UIKit

func logIfTrue(predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}


logIfTrue(predicate: {return 2 > 1})

print("simplify")
logIfTrue(predicate: { 2 > 1})

print("trailing closure")
logIfTrue {return 2 > 1}

print("@autoclosure ->")
func logIfTrue_autoclosure(predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}
logIfTrue_autoclosure(predicate: 2 > 1)

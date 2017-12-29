import UIKit

func logIfTrue(predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}


logIfTrue(predicate: {return 2 > 1})

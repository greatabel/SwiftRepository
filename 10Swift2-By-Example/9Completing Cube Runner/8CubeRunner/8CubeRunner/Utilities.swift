import Foundation

func execAfter(delay:Double, closure:@escaping ()->()) {

    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}


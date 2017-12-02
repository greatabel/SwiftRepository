import Foundation
extension Double {
     func roundToInt() -> Int{
        return Int(Darwin.round(self))
    }
}

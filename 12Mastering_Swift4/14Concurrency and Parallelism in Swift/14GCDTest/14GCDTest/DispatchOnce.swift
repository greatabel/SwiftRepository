import UIKit

class DispatchOnce: NSObject {
    private lazy var _once: () = {
        print("Printed only on the first call")
    }()
    var token: Int = 0
    func example() {
        _ = self._once
        print("Printed for each call")
    }

}

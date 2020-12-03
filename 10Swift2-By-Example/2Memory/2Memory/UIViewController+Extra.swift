import UIKit

extension UIViewController {
//    func execAfter(delay: Double, block: () -> Void) {
//        dispatch_after(
//            dispatch_time(
//                DISPATCH_TIME_NOW,
//                Int64(delay * Double(NSEC_PER_SEC))
//            ),
//            dispatch_get_main_queue(), block)
//    }
    func execAfter(delay: Double, block: @escaping () -> Void) {
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            // Put your code which should be executed with a delay here
//
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: block)
        
    }
}

import UIKit

class CheckoutViewController: UIViewController {
    var cartStore: CartStore!

    static func instantiate() -> UIViewController {
        return UIStoryboard(name: "Checkout", bundle: nil).instantiateInitialViewController()!
    }
}

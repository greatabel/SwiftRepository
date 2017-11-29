import UIKit

class EcommerceViewController: UIViewController {

    static func instantiate() -> UIViewController {
        return UIStoryboard(name: "Ecommerce", bundle: nil).instantiateInitialViewController()!
    }
}


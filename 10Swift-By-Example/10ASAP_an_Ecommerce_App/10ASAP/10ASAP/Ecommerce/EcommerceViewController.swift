import UIKit
import SDWebImage

class EcommerceViewController: UICollectionViewController {

    static func instantiate() -> UIViewController {
        return UIStoryboard(name: "Ecommerce", bundle: nil).instantiateInitialViewController()!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ASAP"
    }
}


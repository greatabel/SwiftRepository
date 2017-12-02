import Foundation
import UIKit

extension EcommerceViewController: SegueHandlerType {
    enum SegueIdentifier: String {
        case ShowCheckoutScene = "ShowCheckoutScene"
    }

    func showCheckoutScene() {
        performSegueWithIdentifier(segueIdentifier: .ShowCheckoutScene, sender: self)
    }
}

extension EcommerceViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {


        switch segueIdentifierForSegue(segue: segue) {
        case .ShowCheckoutScene:
            guard let checkoutViewController = segue.destination as? CheckoutViewController else {
                return
            }
            checkoutViewController.cartStore = cartStore
//            print(cartStore.allProducts())
        }
    }
}

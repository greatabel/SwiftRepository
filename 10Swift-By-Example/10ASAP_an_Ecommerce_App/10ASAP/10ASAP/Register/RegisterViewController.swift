import UIKit
import LatoFont

class RegisterViewController: UIViewController {

    static func instantiate() -> RegisterViewController {
        return UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController()
            as! RegisterViewController
    }
    
}

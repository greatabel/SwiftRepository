import UIKit
import LatoFont

class RegisterViewController: UIViewController {

    @IBOutlet var okButton: UIButton! {
        didSet {
            okButton.isEnabled = false
            okButton.titleLabel?.font = UIFont.latoFont(ofSize: 18)
        }
    }

    @IBOutlet var emailTextField: UITextField! {
        didSet {
            emailTextField.becomeFirstResponder()
            emailTextField.font = UIFont.latoFont(ofSize: 18)
        }
    }

    static func instantiate() -> RegisterViewController {
        return UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController()
            as! RegisterViewController
    }
    
}

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
            print("###")
            emailTextField.becomeFirstResponder()
            emailTextField.font = UIFont.latoFont(ofSize: 18)

        }
    }

    static func instantiate() -> RegisterViewController {
        return UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController()
            as! RegisterViewController
    }

    @IBAction func emailTextFieldChanged(_ sender: UITextField) {
  
//        print(#function)
        guard let text = sender.text else {
            return
        }
        okButton.isEnabled = text.isValidEmail()

//        print(okButton.isEnabled)
    }
    
    @IBAction func signinTapped(_ sender: UIButton) {

        guard let text = emailTextField.text else {
            return
        }
        print(text)
        print(#function)

        AppDelegate.appdelegate().userStore.setUserEmail(email: text)

        performSegue(withIdentifier: "ShowEcommerceScene", sender: self)
    }
    
}

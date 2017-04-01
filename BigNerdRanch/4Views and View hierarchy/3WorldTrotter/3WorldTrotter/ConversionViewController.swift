import UIKit

class ConversationViewController: UIViewController {

    @IBOutlet var celsiusLabel: UILabel!

    @IBOutlet var textField: UITextField!

    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        if let text = textField.text, !text.isEmpty {

            celsiusLabel.text = text
        }
        else {
            celsiusLabel.text = "???"
        }
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }

}

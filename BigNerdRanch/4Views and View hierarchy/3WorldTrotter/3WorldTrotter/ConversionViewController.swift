import UIKit

class ConversationViewController: UIViewController {

    @IBOutlet var celsiusLabel: UILabel!

    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        if let text = textField.text, !text.isEmpty {

            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
//        celsiusLabel.text = TextField.text
    }
}

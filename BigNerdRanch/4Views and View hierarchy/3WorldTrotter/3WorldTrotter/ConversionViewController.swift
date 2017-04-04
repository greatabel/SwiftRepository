import UIKit

@available(iOS 10.0, *)
class ConversationViewController: UIViewController, UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        print("Current text: \(String(describing: textField.text))")
        print("Replacement text: \(string)")

        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")

        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }

//    func textField(_ textField: UITextField, shouldChangeCharactersIn
//        range: NSRange, replacementString string: String) -> Bool {
//        let textFieldText: NSString = (textField.text ?? "") as NSString
//        _ = textFieldText.replacingCharacters(in: range, with: string)
//        print("Current text: \(String(describing: textField.text))")
//        print("Replacement text: \(string)")
//
//        return true
//    }



    @IBOutlet var celsiusLabel: UILabel!

    @IBOutlet var textField: UITextField!

    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()

    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }

    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else{
            return nil
        }
    }

    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        if let text = textField.text, let value = Double(text) {

            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }
        else {
            fahrenheitValue = nil
        }
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }

    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }

}

import UIKit

class UserInputs: UITextField, UITextFieldDelegate {

// https://stackoverflow.com/questions/30770381/custom-class-that-inherits-from-uitextfield-does-not-work-with-custom-init-in
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
//        self.addTarget(self, action: #selector(UserInputs.formatText), for: .editingChanged)
//        createBorder()
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
//        self.addTarget(self, action: #selector(UserInputs.formatText), for: .editingChanged)
//        createBorder()
    }
//    func formatText() {
//        print("formatText")
//        createBorder()
//    }

    func createBorder(){
        self.borderStyle = UITextBorderStyle.line
        print("border created")
    }

    func clearBorder(){
        // https://stackoverflow.com/questions/11319377/cannot-remove-border-of-uitextfield-dynamically
        self.borderStyle = UITextBorderStyle.roundedRect
        self.borderStyle = UITextBorderStyle.none
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 0.0

        print("border clear")
    }

     override func becomeFirstResponder() -> Bool {

        let returnValue = super.becomeFirstResponder()
        if returnValue {
            print("in becomeFirstResponder")
            createBorder()
        }
        return returnValue
    }

    override func resignFirstResponder() -> Bool {
        let returnValue = super.resignFirstResponder()
        if returnValue {
            print("in resignFirstResponder")
            clearBorder()
        }
        return returnValue
    }

//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("focused")
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("lost focus")
//    }

}

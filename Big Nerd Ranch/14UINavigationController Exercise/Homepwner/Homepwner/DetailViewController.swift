import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

//    @IBOutlet var nameField: UITextField!
    @IBOutlet var nameField: UserInputs!

    @IBOutlet var serialNumberField: UITextField!

    @IBOutlet var valueField: UITextField!

    @IBOutlet var dateLabel: UILabel!

    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self

    }


    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }

    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nameField.text = item.name
        serialNumberField.text = item.serialNumber
//        valueField.text = "\(item.valueInDollars)"
//        dateLabel.text = "\(item.dateCreated)"
        valueField.text =
            numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // clear first responder
        view.endEditing(true)
        
        //save changes to item
        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text

        if let valueText = valueField.text,
            let value = numberFormatter.number(from: valueText) {
            item.valueInDollars = value.intValue
        } else {
            item.valueInDollars = 0
        }
    }


}

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameField: UITextField!

    @IBOutlet var serialNumberField: UITextField!

    @IBOutlet var valueField: UITextField!

    @IBOutlet var dateLabel: UILabel!

    var item: Item!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = "\(item.valueInDollars)"
        dateLabel.text = "\(item.dateCreated)"
    }


}

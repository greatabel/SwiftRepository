import UIKit

class DetailViewController: UIViewController, DetailViewModelDelegate {

    var viewModel: DetailViewModel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        navigationController?.title = viewModel.title
        nameField.text = viewModel.name
        amountField.text = viewModel.amount
        nameField.becomeFirstResponder()

        nameField.addTarget(self, action: #selector(DetailViewController.nameChanged),
                            forControlEvents: UIControlEvents.EditingChanged)
        amountField.addTarget(self, action: #selector(DetailViewController.ammountChanged),
                              forControlEvents: UIControlEvents.EditingChanged)

    }

    func nameChanged() {
        viewModel.name = nameField.text!
        resultLabel.text = viewModel.infoText
    }

    func ammountChanged() {
        viewModel.amount = amountField.text!
        resultLabel.text = viewModel.infoText
    }

    func showInvalidName() {
        UIAlertView(title: "Error", message: "Invalid name", delegate: nil, cancelButtonTitle: "OK").show()
        nameField.becomeFirstResponder()
    }

    func showInvalidAmount() {
        UIAlertView(title: "Error", message: "Invalid amount", delegate: nil, cancelButtonTitle: "OK").show()
        amountField.becomeFirstResponder()
    }

    func dismissAddView() {
        navigationController?.popViewControllerAnimated(true)
    }


    @IBAction func donePressed(sender: AnyObject) {
        viewModel.handleDonePressed()
    }

    @IBAction func cancelPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}

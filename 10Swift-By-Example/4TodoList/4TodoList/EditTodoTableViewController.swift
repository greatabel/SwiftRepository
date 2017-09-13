import UIKit

class EditTodoTableViewController: UITableViewController {

    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var listLabel: UILabel!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var dueDatePicker: UIDatePicker!

    var todoToEdit: Todo?
    var todosDatastore: TodosDatastore?
    private var list: List?
    private var dueDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        refresh()
        descriptionTextField.becomeFirstResponder()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

}

private extension EditTodoTableViewController {
    func setup() {

    }
}

extension EditTodoTableViewController {
    func refresh(){

    }
}

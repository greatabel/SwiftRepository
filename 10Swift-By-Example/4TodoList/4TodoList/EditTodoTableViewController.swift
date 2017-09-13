import UIKit

class EditTodoTableViewController: UITableViewController {

    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var listLabel: UILabel!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var dueDatePicker: UIDatePicker!

    var todoToEdit: Todo?
    var todosDatastore: TodosDatastore?
    var list: List?
    var dueDate: Date?

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
        if let todo = todoToEdit {
            descriptionTextField.text = todo.description
            list = todo.list
            dueDate = todo.dueDate
        } else if  let todosDatastore = todosDatastore {
            list = todosDatastore.defaultList()
            dueDate = todosDatastore.defaultDueDate()
        }
        datePickerSetup()
    }

    func datePickerSetup() {
        dueDatePicker.datePickerMode = .dateAndTime
        dueDatePicker.minimumDate = Date()
        dueDatePicker.date = dueDate!
        dueDatePicker.addTarget(self, action: Selector(("dueDateChanged:")),
                                for: .valueChanged)
    }
}

extension EditTodoTableViewController {
    
    func dueDateChanged(sender: UIButton!) {
        dueDate = dueDatePicker.date
        refresh()
    }

    func refresh(){

    }
}

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
        dueDatePicker.addTarget(self,  action: #selector(dueDateChanged(_:)) ,
                                for: .valueChanged)
    }
}

extension EditTodoTableViewController {
    
     func dueDateChanged(_ sender: UIDatePicker) {
        print("###\(self)")
        dueDate = dueDatePicker.date
        refresh()
    }

    func refresh(){
        listLabel.text = "List: \(list!.description)"

        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        if let dueDate = dueDate {
            let formatterDueDate = dateFormatter.string(from: dueDate)
            dueDateLabel.text = "Due date: \(formatterDueDate)"
        }
    }

    func doneSelected() {
        if let descriptionText = descriptionTextField.text,
            let list = list,
            let dueDate = dueDate, !descriptionText.isEmpty {
                let newTodo = Todo(description: descriptionText,
                                   list: list,
                                   dueDate: dueDate,
                                   done: false,
                                   doneDate: nil)
                todosDatastore?.addTodo(todo: newTodo)
        }
    }
    func showAddList() {

    }

}

enum EditTableViewRow: Int {
    case Description
    case List
    case DueDate
    case Done
    case DatePicker
}

extension EditTodoTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("***\(self)")
        switch EditTableViewRow(rawValue: indexPath.row)! {
        case .List:
            showAddList()
        case .DueDate:
            descriptionTextField.resignFirstResponder()
        case .Done:
            doneSelected()
        default:
            break
        }
    }
}

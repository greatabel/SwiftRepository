import UIKit
import MGSwipeTableCell



class TodoTableViewController: UITableViewController {

    public var todosDatastore: TodosDatastore?
    private var todos: [Todo]?
    public var selectedTodo: Todo?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        title = "Todos"
    }

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }

    @IBAction func addTodoBarButtonPressed(sender: AnyObject){
        print("addTodoButtonPressed")
        performSegue(withIdentifier: "addTodo", sender: self)
    }
    

    public func refresh() {
        if let todosDatastore = todosDatastore {
            todos = todosDatastore.todos().sorted {
                $0.dueDate.compare($1.dueDate) == ComparisonResult.orderedAscending
            }
            tableView.reloadData()
        }
    }

    func configure(todosDatastore: TodosDatastore) {
        self.todosDatastore = todosDatastore
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
                        -> UITableViewCell {
                            
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
                            as! MGSwipeTableCell
        if let todo = todos?[indexPath.row] {
            renderCell(cell: cell, todo: todo)
            setupButtonsForCell(cell: cell, todo: todo)
        }
//        cell.textLabel?.text = "Todo number \(indexPath.row)"
        return cell
    }

    private func renderCell(cell:UITableViewCell, todo: Todo){
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY-MM-dd HH:mm"
        let dueDate = dateFormatter.string(from: todo.dueDate)
        cell.detailTextLabel?.text = "\(dueDate) | \(todo.list.description)"
        cell.textLabel?.text = todo.description

        cell.accessoryType = todo.done ? .checkmark : .none
    }

    private func setupButtonsForCell(cell: MGSwipeTableCell, todo: Todo) {
        cell.rightButtons = [
            MGSwipeButton(title: "Edit",
                          backgroundColor: UIColor.blue,
                          padding: 30) {
                            [weak self] sender in
                            self?.editButtonPressed(todo: todo)
                            return true
            },
            MGSwipeButton(title: "Delete",
                          backgroundColor: UIColor.red,
                          padding: 30) {
                            [weak self] sender in
                            self?.deleteButtonPressed(todo: todo)
                            return true
            }
        ]

        cell.rightExpansion.buttonIndex = 0
        cell.leftButtons = [
            MGSwipeButton(title: "Done",
                          backgroundColor: UIColor.green,
                          padding: 30) {
                            [weak self] sender in
                            self?.doneButtonPressed(todo: todo)
                            return true
            } ]
        cell.leftExpansion.buttonIndex = 0
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: Actions
extension TodoTableViewController {
    func addTodoButtonPressed(sender: UIButton!){
        print("addTodoButtonPressed")
        performSegue(withIdentifier: "addTodo", sender: self)
    }

    func editButtonPressed(todo: Todo){
        print("editButtonPressed")
        selectedTodo = todo
        performSegue(withIdentifier: "editTodo", sender: self)
    }

    func deleteButtonPressed(todo: Todo){
        todosDatastore?.deleteTodo(todo: todo)
        refresh()
    }

    func doneButtonPressed(todo: Todo){
        todosDatastore?.doneTodo(todo: todo)
        refresh()
    }
}

extension TodoTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destinationViewController = segue.destination as? EditTodoTableViewController
            else {
                return
        }

        destinationViewController.todosDatastore = todosDatastore
        destinationViewController.todoToEdit = selectedTodo
        selectedTodo = nil

        switch identifier {
        case "addTodo":
            destinationViewController.title = "New Todo"
        case "editTodo":
            destinationViewController.title = "Edit Todo"
        default:
            break
        }
    }
}

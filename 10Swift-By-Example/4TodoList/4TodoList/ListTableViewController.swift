import UIKit

class ListTableViewController: UITableViewController {

    var onListSelected: ((_ list: List) -> Void)?
    var todosDatastore: TodosDatastore?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Lists"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todosDatastore?.lists().count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        if let list = todosDatastore?.lists()[indexPath.row] {
            cell.textLabel?.text = list.description
        }
        cell.selectionStyle = .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = todosDatastore?.lists()[indexPath.row]
        if let list = list, let onListSelected = onListSelected {
            onListSelected(list)
        }
        navigationController?.popViewController(animated: true)
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

extension ListTableViewController {
    @IBAction func addListButtonTapped(sender: AnyObject) {
        let alert = UIAlertController(title: "Enter list name",
                                      message: "To create a new list, please enter the name of the list",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
                    {
                        (action: UIAlertAction!) -> Void in
                                        let textField = alert.textFields?.first
                                        self.addList(description: textField?.text ?? "" )
                    }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addTextField(configurationHandler: nil)
        present(alert,
                              animated: true,
                              completion: nil)
    }

    func addList(description: String) {
        todosDatastore?.addListDescription(description: description as String)
        tableView.reloadData()
    }
}

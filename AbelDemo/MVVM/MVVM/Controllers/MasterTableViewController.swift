import UIKit

class MasterTableViewController: UITableViewController {

    let viewModel = ListViewModel()

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.

    }

    func refresh() {
        viewModel.refresh()
        tableView.reloadData()
    }
    
}

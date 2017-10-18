import UIKit

class ItemListViewController: UIViewController {



    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!

    let itemManager = ItemManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        tableView = UITableView()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider

    }

    @IBAction func addItem(_ sender: UIBarButtonItem) {
        if let nextViewController =
            storyboard?.instantiateViewController(withIdentifier: "InputViewController")
                as? InputViewController {
                nextViewController.itemManager = self.itemManager
                present(nextViewController,animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

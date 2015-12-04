import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
, UITextFieldDelegate {

   
    @IBOutlet weak var tblShoppingList: UITableView!

    @IBOutlet weak var txtAddItem: UITextField!


    @IBOutlet weak var btnAction: UIButton!

    @IBOutlet weak var datePicker: UIDatePicker!


    var shoppingList: NSMutableArray!



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tblShoppingList.delegate = self
        self.tblShoppingList.dataSource = self

        self.txtAddItem.delegate = self

        datePicker.hidden = true
        loadShoppingList()


    }

    func loadShoppingList() {
        let pathsArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory = pathsArray[0] as String
        let shoppingListPath =  NSURL(fileURLWithPath: documentsDirectory)
            .URLByAppendingPathComponent("shopping_list")

        if NSFileManager.defaultManager().fileExistsAtPath(String(shoppingListPath)){
            shoppingList = NSMutableArray(contentsOfFile: String(shoppingListPath))
            tblShoppingList.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0

        if let list = shoppingList{
            rows = list.count
        }

        return rows
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCellItem")! as UITableViewCell

        cell.textLabel?.text = shoppingList.objectAtIndex(indexPath.row) as? String
        return cell
    }

}


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

        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "handleModifyListNotification", name: "modifyListNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "handleDeleteListNotification", name: "deleteListNotification", object: nil)

    }

    func setupNotificationSettings() {
        let notificationSettings: UIUserNotificationSettings! = UIApplication.sharedApplication().currentUserNotificationSettings()

        if (notificationSettings.types == UIUserNotificationType.None) {

        }

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

    func saveShoppingList() {
        let pathsArray = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory = pathsArray[0] as String
        //        let savePath = documentsDirectory.URLByAppendingPathComponent("shopping_list")
        let savePath =  NSURL(fileURLWithPath: documentsDirectory).URLByAppendingPathComponent("shopping_list")
        shoppingList.writeToFile(String(savePath), atomically: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func scheduleReminder(sender: AnyObject) {
        print("in sscheduleReminder")
    }


    func handleModifyListNotification() {
        txtAddItem.becomeFirstResponder()
    }


    func handleDeleteListNotification() {
        shoppingList.removeAllObjects()
        saveShoppingList()
        tblShoppingList.reloadData()
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

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if shoppingList == nil{
            shoppingList = NSMutableArray()
        }
        shoppingList.addObject(textField.text!)

        tblShoppingList.reloadData()

        txtAddItem.text = ""
        txtAddItem.resignFirstResponder()

        saveShoppingList()

        return true
    }


}


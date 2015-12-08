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
        setupNotificationSettings()

        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "handleModifyListNotification", name: "modifyListNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "handleDeleteListNotification", name: "deleteListNotification", object: nil)

    }

    @IBAction func scheduleReminder(sender: AnyObject) {
        print("in sscheduleReminder")
        if datePicker.hidden {
            animateMyViews(tblShoppingList, viewToShow: datePicker)

            UIApplication.sharedApplication().cancelAllLocalNotifications()
        }
        else{
            animateMyViews(datePicker, viewToShow: tblShoppingList)

            scheduleLocalNotification()
        }

        txtAddItem.enabled = !txtAddItem.enabled
    }


    func setupNotificationSettings() {
        let notificationSettings: UIUserNotificationSettings! = UIApplication.sharedApplication().currentUserNotificationSettings()

        if (notificationSettings.types == UIUserNotificationType.None){
            // Specify the notification types.
            var notificationTypes: UIUserNotificationType = [UIUserNotificationType.Alert, UIUserNotificationType.Sound]


            // Specify the notification actions.
            var justInformAction = UIMutableUserNotificationAction()
            justInformAction.identifier = "justInform"
            justInformAction.title = "OK, got it"
            justInformAction.activationMode = UIUserNotificationActivationMode.Background
            justInformAction.destructive = false
            justInformAction.authenticationRequired = false

            var modifyListAction = UIMutableUserNotificationAction()
            modifyListAction.identifier = "editList"
            modifyListAction.title = "Edit list"
            modifyListAction.activationMode = UIUserNotificationActivationMode.Foreground
            modifyListAction.destructive = false
            modifyListAction.authenticationRequired = true

            var trashAction = UIMutableUserNotificationAction()
            trashAction.identifier = "trashAction"
            trashAction.title = "Delete list"
            trashAction.activationMode = UIUserNotificationActivationMode.Background
            trashAction.destructive = true
            trashAction.authenticationRequired = true

            let actionsArray = NSArray(objects: justInformAction, modifyListAction, trashAction)
            let actionsArrayMinimal = NSArray(objects: trashAction, modifyListAction)

            // Specify the category related to the above actions.
            var shoppingListReminderCategory = UIMutableUserNotificationCategory()
            shoppingListReminderCategory.identifier = "shoppingListReminderCategory"
            shoppingListReminderCategory.setActions(actionsArray as! [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Default)
            shoppingListReminderCategory.setActions(actionsArrayMinimal as! [UIUserNotificationAction], forContext: UIUserNotificationActionContext.Minimal)


            let categoriesForSettings = NSSet(objects: shoppingListReminderCategory)


            // Register the notification settings.
            let newNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: categoriesForSettings as! Set<UIUserNotificationCategory>)
            UIApplication.sharedApplication().registerUserNotificationSettings(newNotificationSettings)
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



    func fixNotificationDate(dateToFix: NSDate) -> NSDate {
        let dateComponets: NSDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.NSDayCalendarUnit, NSCalendarUnit.NSMonthCalendarUnit, NSCalendarUnit.NSYearCalendarUnit, NSCalendarUnit.NSHourCalendarUnit, NSCalendarUnit.NSMinuteCalendarUnit], fromDate: dateToFix)

        dateComponets.second = 0

        let fixedDate: NSDate! = NSCalendar.currentCalendar().dateFromComponents(dateComponets)

        return fixedDate
    }


    func scheduleLocalNotification() {
        let localNotification = UILocalNotification()
        let date = NSDate().dateByAddingTimeInterval(1.0 * 60.0)
        localNotification.fireDate = fixNotificationDate(date)
        localNotification.alertBody = "Hey, rember?"
        localNotification.alertAction = "View List"

        localNotification.category = "shoppingListReminderCategory"

        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)

    }


    func handleModifyListNotification() {
        txtAddItem.becomeFirstResponder()
    }


    func handleDeleteListNotification() {
        shoppingList.removeAllObjects()
        saveShoppingList()
        tblShoppingList.reloadData()
    }


    func animateMyViews(viewToHide: UIView, viewToShow: UIView) {
        let animationDuration = 0.35

        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            viewToHide.transform = CGAffineTransformScale(viewToHide.transform, 0.001, 0.001)
            }) { (completion) -> Void in

                viewToHide.hidden = true
                viewToShow.hidden = false

                viewToShow.transform = CGAffineTransformScale(viewToShow.transform, 0.001, 0.001)

                UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                    viewToShow.transform = CGAffineTransformIdentity
                })
        }
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


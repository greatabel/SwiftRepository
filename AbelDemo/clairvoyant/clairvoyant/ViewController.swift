import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    private var userCell = "userCell"
    var managedContext: NSManagedObjectContext!
    
    var users = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // test add
//        self.saveUser("abel",age:20)
        // end test

        
        
        let userFetch = NSFetchRequest(entityName: "User")
        
        
        
        do{
            let fetchedResults =
        try    managedContext.executeFetchRequest(userFetch) as! [User]
            
            users = fetchedResults
//            print("\(users.count) ### \(users[5].name)")
            
        }  catch let unknownError {
//            print("\(unknownError) is an unknown error.")

            print("no user error \n \(unknownError)")
        }
        
        tableView.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            
            return users.count;
    }
    
//    func tableView(tableView: UITableView,
//        titleForHeaderInSection section: Int) -> String? {
//            return "List of Users";
//    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
//            tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            let cell =
            tableView.dequeueReusableCellWithIdentifier(userCell,
                forIndexPath: indexPath)
            
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .ShortStyle
            dateFormatter.timeStyle = .MediumStyle
            
            let user = users[indexPath.row]
            
            
//            var concate = "\(user.name!) \(dateFormatter.stringFromDate( NSDate()))"
//            cell.textLabel!.text = concate
             cell.textLabel!.text = user.name
            return cell
    }
    
    
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            //1
            let userToRemove =  users[indexPath.row]
            
            //2
            managedContext.deleteObject(userToRemove)
            
            // 3
            do {
                try managedContext.save()
            
                }  catch let unknownError {
                    //            print("\(unknownError) is an unknown error.")
                    
                    print("delete user error \n \(unknownError)")
                }
           
            users.removeAtIndex(indexPath.row)
            
            // 4
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
            self.tableView.reloadData()
        }
        
    }


    @IBAction func AddUser(sender: AnyObject) {
        
        if #available(iOS 8.0, *) {
            var nameTextField: UITextField?
            var ageTextField: UITextField?
            
            let alert = UIAlertController(title: "Add New User", message: "请填写姓名和年龄",
                preferredStyle: .Alert)
            let saveAction = UIAlertAction(title: "Save", style: .Default)
                {
                    (action: UIAlertAction!) -> Void in
                    print("show= \(alert.textFields![0]) # \(alert.textFields![1])")
                    
                    let name = alert.textFields![0].text!
                    let age  = Int(alert.textFields![1].text!)!
                    self.saveUser(name,age: age)
                    self.tableView.reloadData()
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Default)
                {
                    (action: UIAlertAction!) -> Void in
            }
            
            
//            alert.addTextFieldWithConfigurationHandler {
//                (textField: UITextField!) -> Void in
//            }
            
            alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
                // Enter the textfiled customization code here.
                nameTextField = textField
                nameTextField?.placeholder = "Name"
            }
            alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
                // Enter the textfiled customization code here.
                ageTextField = textField
                ageTextField?.placeholder = "Age"
//                ageTextField?.secureTextEntry = true
            }
            
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            presentViewController(alert, animated: true,
                completion: nil)
            
            
        } else {
            // Fallback on earlier versions
            
        }
       
        

        
        
//        let randomStr:String = randomStringWithLength(5)
//        self.saveUser(randomStr,age:20)
//        
//         tableView.reloadData()
    }
    
    func saveUser(name:String, age:Int){
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        
        let user = NSManagedObject(entity: entity!,insertIntoManagedObjectContext:managedContext)
        
        user.setValue(name, forKey: "name")
        user.setValue(age, forKey: "age")
        
        do{
           
                try managedContext.save()
            users.append(user as! User)
            
        }catch let unknownError {
                        print("save user error \(unknownError) is an unknown error.")            
           
        }
        
        
        
    }
    
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        

        
        var footerView : UIView?
        footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 170))
        footerView?.backgroundColor = UIColor.whiteColor()
        
        var topBorder: UIView?
        topBorder = UIView(frame: CGRectMake(0, 0, footerView!.frame.size.width, 1))
        topBorder!.backgroundColor = UIColor.init(red: 224/255.0, green: 224/255.0, blue: 224/255.0, alpha: 1.0)
        footerView!.addSubview(topBorder!)
        
        
        let gotoMeasureButton = UIButton(type:UIButtonType.System)
        gotoMeasureButton.backgroundColor = UIColor.greenColor()
//        gotoMeasureButton.backgroundColor = UIColor.clearColor()
        gotoMeasureButton.layer.cornerRadius = 5
        gotoMeasureButton.layer.borderWidth = 1
        gotoMeasureButton.layer.borderColor = UIColor.greenColor().CGColor
        gotoMeasureButton.setTitle("测量", forState: UIControlState.Normal)
        
        let middleLen = (tableView.frame.width - 100)/2
        gotoMeasureButton.frame = CGRectMake(middleLen, 50, 100, 50)
        
        gotoMeasureButton.addTarget(self, action: "buttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        
        footerView?.addSubview(gotoMeasureButton)
        
        return footerView
    }
    
    func buttonTouched(sender:UIButton!){
        print("diklik")
        self.performSegueWithIdentifier("goto_measure", sender: self)

    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 170.0
    }
    
    
    func randomStringWithLength (len : Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for (var i=0; i < len; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        
        return randomString as String
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
//        print("segue= \(segue) identifier=\(segue.identifier) sender=\(sender)")
        
        if (segue.identifier == "Details") {
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
        let userHistoryVC = segue.destinationViewController as! userHistoryViewController
        

            let userName = users[indexPath.row].name
            userHistoryVC.userName = userName
        }

    }
    

}


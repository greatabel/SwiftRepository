import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
                        UITextFieldDelegate{

    var shoppingList: NSMutableArray!
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


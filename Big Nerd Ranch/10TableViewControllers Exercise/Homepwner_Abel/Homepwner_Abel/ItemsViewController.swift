import UIKit

class ItemsViewController: UITableViewController {

    var itemStore: ItemStore!
    var sectionData:[[Item]] = []



    override func viewDidLoad() {
        super.viewDidLoad()

        // get the height of the status bar
        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
//        print(itemStore.allItems.count)
        var a = itemStore.allItems.filter({$0.valueInDollars > 50})
        var b = itemStore.allItems.filter({$0.valueInDollars <= 50})
        sectionData.append(a)
        sectionData.append(b)
//        print(sectionData[0],sectionData[1])

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        let item = itemStore.allItems[indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "&\(item.valueInDollars)"
        
        return cell
    }
    
    // http://stackoverflow.com/questions/29578965/how-do-i-populate-two-sections-in-a-tableview-with-two-different-arrays-using-sw

    
}

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
        let a = itemStore.allItems.filter({$0.valueInDollars > 50})
        let b = itemStore.allItems.filter({$0.valueInDollars <= 50})
        sectionData.append(a)
        sectionData.append(b)
//        print(sectionData[0],sectionData[1])

        // challenge 2:
        // 不太好的解决问题2的方案：
//        sectionData[1].append(Item(name: "No More", serialNumber: "123", valueInDollars: 0))
//        self.tableView.beginUpdates()
//        let indexPath:IndexPath = IndexPath(row:(sectionData[1].count - 1), section:0)
//
//        self.tableView.insertRows(at: [indexPath], with: .left)
//
//        self.tableView.endUpdates()
//
//        self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemStore.allItems.count
        return sectionData[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

//        let item = itemStore.allItems[indexPath.row]
         let item = sectionData[indexPath.section][indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "&\(item.valueInDollars)"
        
        return cell
    }

    // http://stackoverflow.com/questions/29578965/how-do-i-populate-two-sections-in-a-tableview-with-two-different-arrays-using-sw
    // http://stackoverflow.com/questions/40415223/numberofsectionsintableview-not-working
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionData.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "大于50的区间 -->"
        }
        else{
            return "剩余的 -->"
        }
    }

    // http://stackoverflow.com/questions/39614268/how-do-you-change-the-colour-of-a-section-title-in-a-tableview
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view:UIView, forSection: Int) {
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = UIColor.blue
        }
    }



    
}

import UIKit

class ItemsViewController: UITableViewController {

    var itemStore: ItemStore!
    var sectionData:[[Item]] = []

    func removeItem(_ mypath: IndexPath){
        if mypath[0] == 0 {
//            if let index = sectionData[0].index(of: newitem){
                sectionData[0].remove(at: mypath[1])
//            }
        } else {
//            if let index = sectionData[1].index(of: newitem){
                sectionData[1].remove(at: mypath[1])
//            }
        }
    }

    func moveItem(from fromIndex: IndexPath, to toIndex: IndexPath){
        if fromIndex == toIndex {
            return
        }
        let movedItem = sectionData[fromIndex[0]][fromIndex[1]]

        sectionData[fromIndex[0]].remove(at: fromIndex[1])

        sectionData[toIndex[0]].insert(movedItem, at: toIndex[1])
    }

    @IBAction func addNewItem(_ sender: UIButton){
        print("add")

//        let lastRow = tableView.numberOfRows(inSection: 0)
//        let indexPath = IndexPath(row: lastRow, section: 0)
//
//        // insert this new row into the table
//        tableView.insertRows(at: [indexPath], with: .automatic)
        // Create a new item and add it to the store
//        let newItem = itemStore.createItem()
        let newItem = Item(random: true)
        var indexPath: IndexPath!
        if newItem.valueInDollars > 50 {
            sectionData[0].append(newItem)
            indexPath = IndexPath(row: sectionData[0].count - 1, section: 0)
        } else {
            sectionData[1].append(newItem)
            //因为section 1的最后一个是：no more item
            indexPath = IndexPath(row: sectionData[1].count - 2, section: 1)
        }

        // Figure out where that item is in the array
//        if let index = itemStore.allItems.index(of: newItem) {
//            let indexPath = IndexPath(row: sectionData[0].count - 1, section: 0)
            // Insert this new row into the table
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
//        }
//        }
    }

    @IBAction func toggleEditingMode(_ sender: UIButton){
        print("edit")
        if isEditing {
            sender.setTitle("Edit", for: .normal)

            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)

            setEditing(true, animated: true)
        }
    }


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

        sectionData[1].append(Item(name: "No More items!", serialNumber: "", valueInDollars: -1))


    }

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        // challenge 3
        // https://grokswift.com/transparent-table-view/
        let backgroundImage = UIImage(named: "GrokSwiftLogo500.png")
        let imageView = UIImageView(image: backgroundImage)

//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = imageView.bounds
//        imageView.addSubview(blurView)

        tableView.backgroundView = imageView

        // center and scale background image
        imageView.contentMode = .scaleAspectFit

        // Set the background color to match better
        tableView.backgroundColor = UIColor.cyan

        // no lines where there aren't cells 行内没有内容时候不显示行线
        let CGRectZero = CGRect(x: 0, y: 0, width: 0, height: 0)
        tableView.tableFooterView = UIView(frame: CGRectZero)

    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      // challenge 3: 让tableview透明
//        cell.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }




    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemStore.allItems.count
        print("sectionData[\(section)].count: \(sectionData[section].count)")
        return sectionData[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        // challenge 2: method 2
        // http://stackoverflow.com/questions/40057420/set-last-tableview-cell-as-constant-cell-among-variable-cells-in-swift


//        let item = itemStore.allItems[indexPath.row]
         let item = sectionData[indexPath.section][indexPath.row]
//        print("\(item.name) ### \((indexPath as NSIndexPath).row)")
//        print("count= \(sectionData[0].count) \(sectionData[1].count)")
        if( (indexPath as NSIndexPath).row == sectionData[1].count-1 &&
            indexPath.section == 1) {
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = ""
        }
        else {
        // challenge 3
        cell.textLabel?.font = UIFont(name:"System", size:20)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "&\(item.valueInDollars)"
        }
        
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

    // challenge 3
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        if( (indexPath as NSIndexPath).row == sectionData[1].count-1) {
            height = 44
        }
        else {
            height = 60

        }
        return height
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // ch11 challenge 3
        if editingStyle == .delete && (indexPath != [1, sectionData[1].count-1 ]) {

            let title = "删除 \(sectionData[indexPath[0]][indexPath[1]].name)?"
            let message = "你确定要删除这个项目吗？"
            let  ac = UIAlertController(title: title, message: message,
                                        preferredStyle: .actionSheet)

            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            ac.addAction(cancelAction)

            let deleteAction = UIAlertAction(title: "删除", style: .destructive,
                                             handler: {
                                                (action) -> Void in
                                            print("delete: \(indexPath)")
                                            self.removeItem(indexPath)
                                            // also rm the row from table view
                                            tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)
//            let item = itemStore.allItems[indexPath.row]
//            print("delete: \(indexPath)")
//            removeItem(indexPath)
//            // also rm the row from table view
//            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        // ch11 challenge 3
        if (indexPath == [1, sectionData[1].count-1 ]) {
            return nil
        } else {
        return "Remove"
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("move: \(sourceIndexPath) -> \(destinationIndexPath)")
        moveItem(from: sourceIndexPath, to: destinationIndexPath)
    }

    // ch11 : challenge 2
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if(sourceIndexPath == [1, sectionData[1].count-1 ] ||
            proposedDestinationIndexPath == [1, sectionData[1].count-1 ]){
            print("here:no more!")
            return sourceIndexPath
        }
        else {
            return proposedDestinationIndexPath
        }
    }






    
}

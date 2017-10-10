import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource {

    var itemManager: ItemManager?
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let numberOfRows: Int
        switch section {
        case 0:
            numberOfRows = itemManager?.toDoCount ?? 0
        case 1:
            numberOfRows = 0
        default:
            numberOfRows = 0
        }
        return numberOfRows

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}

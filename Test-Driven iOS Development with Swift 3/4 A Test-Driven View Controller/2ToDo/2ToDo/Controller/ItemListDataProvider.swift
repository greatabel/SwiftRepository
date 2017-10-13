import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource,
        UITableViewDelegate {

    var itemManager: ItemManager?

    enum Section: Int {
        case toDo
        case done
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        guard let itemManager = itemManager else { return 0 }
        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }
        let numberOfRows: Int
        switch itemSection {
        case .toDo:
            numberOfRows = itemManager.toDoCount
        case .done:
            numberOfRows = itemManager.doneCount
        }
        return numberOfRows

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",
                                                 for: indexPath) as! ItemCell

        guard let itemManager = itemManager else {
            fatalError() }
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        let item : ToDoItem
        switch section {
        case .toDo:
            item = itemManager.item(at: indexPath.row)
        case .done:
            item = itemManager.doneItem(at: indexPath.row)
        }

        cell.configCell(with: item)

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        titleForDeleteConfirmationButtonForRowAt indexPath:
        IndexPath) -> String? {
        return "Check"
    }

}

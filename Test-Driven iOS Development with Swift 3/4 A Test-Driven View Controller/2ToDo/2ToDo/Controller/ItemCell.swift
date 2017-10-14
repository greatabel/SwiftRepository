import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var locationLabel: UILabel!

    @IBOutlet var dateLabel: UILabel!
    
    func configCell(with item: ToDoItem) {
        titleLabel.text = item.title

    }

}

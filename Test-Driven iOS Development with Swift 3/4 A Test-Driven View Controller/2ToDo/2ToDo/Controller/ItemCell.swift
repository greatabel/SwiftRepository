import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var locationLabel: UILabel!

    @IBOutlet var dateLabel: UILabel!

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()

    func configCell(with item: ToDoItem) {
        titleLabel.text = item.title
        locationLabel.text = item.location?.name

        if let timestamp = item.timestamp {
            let date = Date(timeIntervalSince1970: timestamp)
            dateLabel.text = dateFormatter.string(from: date)
        }
    }

}

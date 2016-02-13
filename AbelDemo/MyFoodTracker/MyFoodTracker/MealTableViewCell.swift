import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!

//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


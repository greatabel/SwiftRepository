import UIKit

class SmallImageTableViewCell: UITableViewCell {

    var imageViewL = UIImageView()
    var imageViewM = UIImageView()
    var imageViewR = UIImageView()
    var titleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

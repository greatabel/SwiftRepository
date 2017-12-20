import UIKit

class SmallImageTableViewCell: UITableViewCell {

    lazy var imageViewL: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    lazy var imageViewM: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    lazy var imageViewR: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

import UIKit
import SnapKit

class ImageTableViewCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    lazy var bigImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(bigImageView)
        self.contentView.addSubview(titleLabel)
        setupLayout()
    }

    func setupLayout() {
        titleLabel.snp.makeConstraints{ (make) in
            make.left.top.right.equalTo(self.contentView).inset(UIEdgeInsetsMake(15, 15, 0, 15))
        }
        bigImageView.snp.makeConstraints{ (make) in
            make.left.right.equalTo(self.contentView).inset(UIEdgeInsetsMake(0, 15, 0, 15))
            make.top.equalTo(titleLabel.snp.bottom).offset(-15)
            make.bottom.equalTo(self.contentView).offset(-15)
        }


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

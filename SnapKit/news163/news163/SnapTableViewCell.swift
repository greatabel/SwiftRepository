import UIKit
import SnapKit

class SnapTableViewCell: UITableViewCell {

    var testImageView = UIImageView()
    var titleLabel = UILabel()
    var detailLabel = UILabel()
    var typeLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(testImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(detailLabel)
        self.contentView.addSubview(typeLabel)
        setLayout()
    }

    func setLayout() {
        testImageView.snp.makeConstraints{ (make) in
            make.top.bottom.left.equalTo(self.contentView)
                .inset(UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 0))
        }

        titleLabel.snp.makeConstraints{ (make) in
            make.left.equalTo(testImageView).offset(15)
            make.top.equalTo(testImageView)
            make.right.equalTo(self.contentView).offset(-15)
        }

        detailLabel.snp.makeConstraints{ (make) in
            make.left.equalTo(testImageView).offset(15)
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
        }
        typeLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.contentView).offset(-15)
            make.right.equalTo(self.contentView).offset(-15)
            make.right.equalTo(self.contentView).offset(-15)
        }

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

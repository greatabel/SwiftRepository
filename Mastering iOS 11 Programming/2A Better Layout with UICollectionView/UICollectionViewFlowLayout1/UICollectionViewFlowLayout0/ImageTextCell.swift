import UIKit
class ImageTextCell: UICollectionViewCell {

    var imageView: UIImageView?
    var imageStr: String? {

        didSet {
            self.imageView!.image = UIImage(named: self.imageStr!)
        }

    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.imageView = UIImageView()
        self.addSubview(self.imageView!)

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = self.bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}




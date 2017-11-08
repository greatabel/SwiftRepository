import UIKit

class ContactCollectionViewCell: UICollectionViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contactImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        contactImage.layer.cornerRadius = 25
        contactImage.layer.masksToBounds = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        contactImage.image = nil
    }
}

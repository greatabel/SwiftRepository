import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet var modelLabel: UILabel! {
        didSet {
            modelLabel.font = UIFont.latoFont(ofSize: 18)
        }
    }

    @IBOutlet var imageView: UIImageView!

    @IBOutlet var descriptionLabel: UILabel!  {
        didSet {
            descriptionLabel.font = UIFont.latoFont(ofSize: 18)
        }
    }
    
    @IBOutlet var priceLabel: UILabel! {
        didSet {
            priceLabel.font = UIFont.latoBoldFont(ofSize: 18)
        }
    }
}

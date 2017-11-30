import UIKit
import SDWebImage

class EcommerceViewController: UICollectionViewController {

    static func instantiate() -> UIViewController {
        return UIStoryboard(name: "Ecommerce", bundle: nil).instantiateInitialViewController()!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ASAP"
    }
}

extension EcommerceViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
        -> Int {
        return 40
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCollectionViewCell
//        switch arc4random_uniform(4) {
//        case 0:
//            cell.backgroundColor = UIColor.red
//        case 1:
//            cell.backgroundColor = UIColor.green
//        case 2:
//            cell.backgroundColor = UIColor.blue
//        default:
//            cell.backgroundColor = UIColor.orange
//        }
//        return cell
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            as! ProductCollectionViewCell

        cell.modelLabel.text = "Ex Model"
        cell.descriptionLabel.text = "Ex Description"
        cell.imageView.sd_setImage(with: URL(string: "https://img1.doubanio.com/view/commodity_story/mlarge/public/p13136219.jpg")!)
        cell.priceLabel.text = "$123"

        cell.backgroundColor = UIColor.clear

        return cell
    }



}

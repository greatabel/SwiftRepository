import UIKit
import SDWebImage

class EcommerceViewController: UICollectionViewController {

    let productStore = ProductStore(gateway: LocalProductGateway())
    private var products: [Product] = []
    let cartStore = CartStore(gateway: LocalCartGateway())

    static func instantiate() -> UIViewController {
        return UIStoryboard(name: "Ecommerce", bundle: nil).instantiateInitialViewController()!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ASAP"
        productStore.retrieve { [weak self] products in
            self?.products = products
            self?.collectionView?.reloadData()
        }
    }
}

extension EcommerceViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
        -> Int {
        return products.count
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        if cartStore.containsProductID(productID: product.id) {
            cartStore.removeProduct(product: product)
        } else {
            cartStore.addProduct(product: product)
        }
        collectionView.reloadData()

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

        let product = products[indexPath.row]

        cell.modelLabel.text = product.name
        cell.descriptionLabel.text = product.description
        cell.imageView.sd_setImage(with: product.imageURL)
        cell.priceLabel.text = "$\(product.price)"
//        cell.modelLabel.text = "Ex Model"
//        cell.descriptionLabel.text = "Ex Description"
//        cell.imageView.sd_setImage(with: URL(string: "https://img1.doubanio.com/view/commodity_story/mlarge/public/p13136219.jpg")!)
//        cell.priceLabel.text = "$123"
        if cartStore.containsProductID(productID: product.id){
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.clear
        }


        return cell
    }



}

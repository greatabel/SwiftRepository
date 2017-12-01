import UIKit
import SDWebImage
import BBBadgeBarButtonItem
import FontAwesomeKit


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
        setupCart()
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
        refreshCartCount()
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

extension EcommerceViewController {
    func setupCart() {
        let button = UIButton(type: .custom)
        let icon = FAKFontAwesome.shoppingCartIcon(withSize: 20)
        button.setAttributedTitle(icon?.attributedString(), for: .normal)
        button.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)

        let cartBarButton = BBBadgeBarButtonItem(customUIButton: button)
        cartBarButton?.badgeOriginX = 0
        cartBarButton?.badgeOriginY = 0
        navigationItem.rightBarButtonItem = cartBarButton
    }

    @objc func cartButtonTapped(sender: UIButton) {
        print("showCheckoutScene()")
        showCheckoutScene()
    }

    func refreshCartCount() {
        guard let cartBarButton = navigationItem.rightBarButtonItem as? BBBadgeBarButtonItem else {
            return
        }

        cartBarButton.badgeValue = "\(cartStore.count())"
    }
}

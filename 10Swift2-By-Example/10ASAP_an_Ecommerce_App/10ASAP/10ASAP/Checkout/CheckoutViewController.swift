import UIKit

class CheckoutViewController: UIViewController {
    var cartStore: CartStore!



    @IBOutlet var tableView: UITableView!  {
        didSet {
            tableView.separatorInset = UIEdgeInsets.zero
        }
    }

    @IBOutlet var buyButton: UIButton!  {
        didSet {
            buyButton.titleLabel?.font = UIFont.latoFont(ofSize: 24)
        }
    }

    @IBAction func buyTapped() {
        print(#function)
        cartStore.buy()

        let alert = UIAlertController(title: "Done", message: "感谢购物!",
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,
                                      handler: { _ in
            self.navigationController?.popToRootViewController(animated: false)
        }))

        present(alert, animated: true, completion: nil)
    }

    static func instantiate() -> UIViewController {
        return UIStoryboard(name: "Checkout", bundle: nil).instantiateInitialViewController()!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("CheckoutViewController= \(cartStore.allProducts())")
        refreshTotal()
        // https://stackoverflow.com/questions/33694415/how-to-connect-datasource-and-delegate-with-code-ios-swift
    }
}

private extension CheckoutViewController {
    func refreshTotal(){
        title = "Total: $\(cartStore.total)"
    }
}

extension CheckoutViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartStore.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let product = cartStore.allProducts()[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.latoLightFont(ofSize: 15)
        cell.textLabel?.text = product.name
        cell.imageView?.sd_setImage(with: product.imageURL)

        return cell
    }
}

extension CheckoutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "delete") {
            [weak self] action, index in
            guard let product = self?.cartStore.allProducts()[index.row] else {
                return
            }
            self?.cartStore?.removeProduct(product: product)
            self?.refreshTotal()
            tableView.reloadData()
        }
        return [delete]
    }
}

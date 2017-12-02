import Foundation


class CartStore {
    private var products = [String:Product]()
    private let gateway: CartGateway

    init(gateway: CartGateway) {
        self.gateway = gateway
    }

    func containsProductID(productID: String) -> Bool {
        return products[productID] != nil
    }

    func addProduct(product: Product) {
        products[product.id] = product
        gateway.addProductID(productID: product.id)
    }

    func removeProduct(product: Product) {
        products.removeValue(forKey: product.id)
        gateway.removeProductID(productID: product.id)
    }

    func buy() {
        products = [:]
        gateway.buy()
    }

    func count() -> Int {
        return products.count
    }

    var total: Double {
        get {
            return products.values.reduce(0) { partial, product in
                return partial + product.price
            }
        }
    }

    func allProducts() -> [Product] {
        return [Product](products.values)
    }

}

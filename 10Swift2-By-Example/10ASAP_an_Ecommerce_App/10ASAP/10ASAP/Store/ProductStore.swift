import Foundation
import SwiftyJSON

class ProductStore {
    private struct ProductKeys {
        static let products = "products"
        static let ID = "id"
        static let name = "name"
        static let price = "price"
        static let description = "description"
        static let imageURL = "imageURL"
    }

    private let gateway: ProductGateway

    init(gateway: ProductGateway) {
        self.gateway = gateway
    }

    func retrieve(completion: (([Product]) -> Void)) {

        gateway.getProducts() { productsJSON in
            if let dataFromString = productsJSON.data(using: String.Encoding.utf8, allowLossyConversion: false) {
                do {
                let json = try JSON(data: dataFromString)

                let productsJSON = json[ProductKeys.products]

                let products = productsJSON.map { (index, product) in
                    Product(
                        id: product[ProductKeys.ID].stringValue,
                        name: product[ProductKeys.name].stringValue,
                        price: product[ProductKeys.price].doubleValue,
                        description: product[ProductKeys.description].stringValue,
                        imageURL: URL(string: product[ProductKeys.imageURL].stringValue)!
                    )
                }
                completion(products)
                } catch {
                    print(error)
                }
            }
        }
    }
}


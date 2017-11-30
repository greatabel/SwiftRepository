import Foundation

protocol CartGateway {
    func addProductID(productID: String)
    func removeProductID(productID: String)
    func buy()
}


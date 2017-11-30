import Foundation

protocol ProductGateway {
    func getProducts(completion: (String) -> Void)
}

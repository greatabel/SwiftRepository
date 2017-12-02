import Foundation

class LocalProductGateway: ProductGateway {
    func getProducts(completion: (String) -> Void) {

        let path = Bundle.main.path(forResource: "products", ofType: "json")

        do {
            completion(try String(contentsOfFile: path!, encoding: String.Encoding.utf8))
        } catch {
            completion("[:]")
        }
    }
}


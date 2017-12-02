import Foundation

let dbRepository = DBRepository()

class DBRepository {
    func allProducts() -> String {
        print("Get /products")

        do {
            let productsAsNSString = try NSString(contentsOfFile: "products.json", 
                encoding: NSUTF8StringEncoding)
#if os(Linux)
            return productsAsNSString.bridge()
#else
            return productsAsNSString as String
#endif
        }
        catch {
            print("Error")    
        }
        return "{ products: [] }"
    }

    func addToCartUser(userEmail: String, productID: String) {
        // add to cart of the user
        print("Add product \(productID) to cart of user \(userEmail)")
    }

    func removeFromCartUser(userEmail: String, productID: String) {
        // remove from cart of the user
        print("Remove product \(productID) to cart of user \(userEmail)")
    }

    func orderCreatedFromCartUser(userEmail: String) -> String {
        // create a new order from the cart
        print("Create order from cart of user \(userEmail)")
        let orderID = "1"
        return orderID
    }
}
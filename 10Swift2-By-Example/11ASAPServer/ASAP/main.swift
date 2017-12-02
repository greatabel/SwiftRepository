import swiftra
import JSON
import Foundation

#if os(Linux)
    import Glibc
#endif

struct ParamKeys {
    static let ProductID = "productID"
    static let UserEmail = "useremail"
}

get("/products") { req in
    return dbRepository.allProducts()
}

post("/customer/:useremail/cart/:productID") { req in
    guard let userEmail = req.parameters[ParamKeys.UserEmail],
        let productID = req.parameters[ParamKeys.ProductID] else {
            return Response(.BadRequest)
        }
    dbRepository.addToCartUser(userEmail, productID: productID)
    return "OK"
}

delete("/customer/:useremail/cart/:productID") { req in
    guard let userEmail = req.parameters[ParamKeys.UserEmail],
        let productID = req.parameters[ParamKeys.ProductID] else {
            return Response(.BadRequest)
        }
    dbRepository.removeFromCartUser(userEmail, productID: productID)
    return "OK"
}

post("/customer/:useremail/orders") { req in
    guard let userEmail = req.parameters[ParamKeys.UserEmail] else {
            return Response(.BadRequest)
        }
    return dbRepository.orderCreatedFromCartUser(userEmail)
}

print("Starting...")
serve(8888)
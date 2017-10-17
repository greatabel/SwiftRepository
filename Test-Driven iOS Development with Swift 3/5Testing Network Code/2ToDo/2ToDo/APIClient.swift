import UIKit

protocol SessionProtocol {
    func dataTask(
        with url: URL,
        completionHandler: @escaping
        (Data?, URLResponse?, Error?) -> Void)
        -> URLSessionDataTask
}
extension URLSession: SessionProtocol {}

class APIClient {


//    lazy var session: URLSession = URLSession.shared
    lazy var session: SessionProtocol = URLSession.shared as SessionProtocol

    func loginUser(withName username: String,
                   password: String,
                   completion: @escaping (Token?, Error?) -> Void) {
        guard let url = URL(string: "https://awesometodos.com") else {
            fatalError()
        }
        session.dataTask(with: url) { (data, response, error) in
        }
    }

}

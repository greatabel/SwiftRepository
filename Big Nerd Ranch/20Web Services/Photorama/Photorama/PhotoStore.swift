import Foundation

enum PhotoResult {
    case success([Photo])
    case failture(Error)
}

class PhotoStore {

    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    private func processPhotosRequest(data: Data?, error: Error?) -> PhotoResult {
        guard let jsonData = data else {
            return .failture(error!)
        }
        return FlickrAPI.photos(fromJSON: jsonData)
    }

    func fetchInterestingPhotos(completion: @escaping (PhotoResult) -> Void) {
        let url = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
//            if let jsonData = data {
////                if let jsonString = String(data: jsonData, encoding: .utf8) {
////                                           print(jsonString)
////                }
//                do {
//                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                    print(jsonObject)
//                } catch let error {
//                    print("Error creating JSON object: \(error)")
//                }
//
//            } else if let requestError = error {
//                print("Error fetching interesting photos: \(requestError)")
//            } else {
//                print("Unexpected error with the request")
//            }
            let result = self.processPhotosRequest(data: data, error: error)
            completion(result)
        }
        
        task.resume()
    }

}

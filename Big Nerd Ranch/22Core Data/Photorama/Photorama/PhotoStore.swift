import CoreData
import UIKit

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

enum PhotoError: Error {
    case imageCreationError
}

enum PhotosResult {
    case success([Photo])
    case failure(Error)
}

class PhotoStore {

    let imageStore = ImageStore()

    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Photorama")
        container.loadPersistentStores {
            (description, error) in
            if let error = error {
                print("Error setting up core data (\(error).")
            }
        }
        return container
    }()

    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    private func processPhotosRequest(data: Data?, error: Error?) -> PhotosResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return FlickrAPI.photos(fromJSON: jsonData, into: persistentContainer.viewContext)
    }

    func processImageRequest(data: Data?, error: Error?) -> ImageResult {

        guard
            let imageData = data,
            let image = UIImage(data: imageData) else {

                // Couldn't create an image
                if data == nil {
                    return .failure(error!)
                } else {
                    return .failure(PhotoError.imageCreationError)
                }
        }

        return .success(image)
    }

    func fetchInterestingPhotos(completion: @escaping (PhotosResult) -> Void) {
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



            // excercise a:
//            let httpResponse = response as! HTTPURLResponse
//            print("response ->", httpResponse.statusCode, httpResponse.allHeaderFields)

            let result = self.processPhotosRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }

        }
        
        task.resume()
    }

    func fetchImage(for photo: Photo, completion: @escaping (ImageResult) -> Void) {

//        let photoKey = photo.photoID
//        print("photoKey = \(photoKey)")
        guard let photoKey = photo.photoID else {
            preconditionFailure("Photo expected to have a photoID.")
        }

        if let image = imageStore.image(forKey: photoKey){
            OperationQueue.main.addOperation {
                completion(.success(image))
            }
            return
        }

        guard let photoURL = photo.remoteURL else {
            preconditionFailure("Photo expected to have a remote URL.")
        }
//        let photoURL = photo.remoteURL
        print("photoURL->", photoURL)
        let request = URLRequest(url: photoURL as! URL)

        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in

            let result = self.processImageRequest(data: data, error: error)

            if case let .success(image) = result {
                self.imageStore.setImage(image, forKey: photoKey)
            }

            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }

}

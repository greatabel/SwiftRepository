import FlickrKit

class FlickrDatastore {
    // 末尾加过1
    private let OBJECTIVE_FLICKR_API_KEY = "78336af48557fd52e45af9f30b6f0526"
    private let OBJECTIVE_FLICKR_API_SHARED_SECRET = "749826712d6aa140"
    private let GROUP_ID = "1463451@N25"

    func retrieveImageAtLat(lat: Double, lon: Double, closure: @escaping (_ image: UIImage?) -> Void){
        let fk = FlickrKit.shared()
        fk.initialize(withAPIKey: OBJECTIVE_FLICKR_API_KEY,
                      sharedSecret: OBJECTIVE_FLICKR_API_SHARED_SECRET)
        fk.call("flickr.photos.search", args: [
            "group_id": GROUP_ID,
            "lat": "\(lat)",
            "lon": "\(lon)",
            "radius": "10"
            ], maxCacheAge: FKDUMaxAge.oneHour, completion: { (response, error) -> Void in

                if error == nil{
                    DispatchQueue.main.async(execute: { () -> Void in
                        if let response = response,
                            let photoArray = FlickrKit.shared().photoArray(fromResponse: response) {
                            print("photoArray.count = \(photoArray.count) @ \(photoArray[0])")
                            let randomIndex = Int(arc4random_uniform(UInt32(photoArray.count)))
                            let chosedOne =  photoArray[randomIndex]
                            let photoURL = FlickrKit.shared().photoURL(for: FKPhotoSize.medium640,
                                                                       fromPhotoDictionary: chosedOne)
                            print("photoURL = \(photoURL)")
                            self.extractImageFk(myurl: photoURL, closure: closure)
//                            for photoDictionary in photoArray {
//                                let photoURL = FlickrKit.shared().photoURL(for: FKPhotoSize.small320, fromPhotoDictionary: photoDictionary)
//                                print("#",photoURL)
//                                photoURLs.append(photoURL)
//                            }

//                            completionHandler(photoURLs,nil)
                        }
                    })
                }
                else{

                    print(error)
//                    completionHandler(nil,error as? NSError)
                }

        })
    }

    private func extractImageFk(myurl: URL , closure: (_ image: UIImage?) -> Void) {
//        let image = UIImage(data: Data(contentsOfURL: url))

        guard let imageData = try? Data(contentsOf: myurl) else {
            print("There was an error!")
            // return or break
            return
        }
        if let image = UIImage(data: imageData )
        {
            //Do something
            closure(image)
        }


    }
//    private func extractImageFk(fk: FlickrKit, response: Dictionary<String, Any>?,
//                                error: NSError?, closure: (_ image: UIImage?) -> Void) {
//        if let response = response,
//            let photos = response["photos"] as? [String:AnyObject],
//            let listOfPhotos: AnyObject = photos["photo"], listOfPhotos.count > 0 {
//            let randomIndex = Int(arc4random_uniform(UInt32(listOfPhotos.count)))
//            let photo = listOfPhotos[randomIndex] as! [String:AnyObject]
//            let url = fk.photoURLForSize(FKPhotoSize.FKPhotoSizeMedium640,
//                                         fromPhotoDictionary: photo)
//            let image = UIImage(data: NSData(contentsOfURL: url)!)
//            dispatch_async(dispatch_get_main_queue()){
//                closure(image: image!)
//            }
//        } else {
//            print(error)
//            print(response)
//        }
//    }

}

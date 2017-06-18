import UIKit

class PhotosViewController: UIViewController {

//    @IBOutlet var imageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!

    var store: PhotoStore!

    let photoDataSource = PhotoDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(#function)
        collectionView.dataSource = photoDataSource
        store.fetchInterestingPhotos {
            (photoResult) -> Void in
            switch photoResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")

                self.photoDataSource.photos = photos
//                if let firstPhoto = photos.first {
////                    self.updateImageView(for: firstPhoto)
//                }

            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
        
    }

//    func updateImageView(for photo: Photo) {
//        store.fetchImage(for: photo) {
//            (imageResult) -> Void in
//            switch imageResult {
//            case let .success(image):
////                self.imageView.image = image
//                print("success")
//            case let .failure(error):
//                print("Error downloading image: \(error)")
//            }
//        } }

 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

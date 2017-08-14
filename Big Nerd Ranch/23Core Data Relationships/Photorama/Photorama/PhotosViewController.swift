import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {

//    @IBOutlet var imageView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!

    var store: PhotoStore!

    let photoDataSource = PhotoDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(#function)
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self

        updateDataSource()

        store.fetchInterestingPhotos {
            (photoResult) -> Void in
//            switch photoResult {
//            case let .success(photos):
//                print("Successfully found \(photos.count) photos.")
//
//                self.photoDataSource.photos = photos
////                if let firstPhoto = photos.first {
//////                    self.updateImageView(for: firstPhoto)
////                }
//
//            case let .failure(error):
//                print("Error fetching interesting photos: \(error)")
//                self.photoDataSource.photos.removeAll()
//            }
//            self.collectionView.reloadSections(IndexSet(integer: 0))
            self.updateDataSource()
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        let photo = photoDataSource.photos[indexPath.row]

        //download image data
         store.fetchImage(for: photo) { (result) -> Void in
            guard let photoIndex = self.photoDataSource.photos.index(of: photo),
                case let .success(image) = result else {
                    return
            }
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)

            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as?
                PhotoCollectionViewCell {
                cell.update(with: image)
            }
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showPhoto"?:
            if let selectedIndexPath =
                collectionView.indexPathsForSelectedItems?.first {
                let photo = photoDataSource.photos[selectedIndexPath.row]
                let destinationVC = segue.destination as! PhotoInfoViewController
                destinationVC.photo = photo
                destinationVC.store = store
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }

    private func updateDataSource() {
        store.fetchAllPhotos {
            (photosResult) in
            switch photosResult {
            case let .success(photos):
                self.photoDataSource.photos = photos
            case .failure:
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
}

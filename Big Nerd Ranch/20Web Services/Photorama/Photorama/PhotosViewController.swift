import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    var store: PhotoStore!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(#function)
        store.fetchInterestingPhotos {
            (photoResult) -> Void in
            switch photoResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")

                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }

            case let .failture(error):
                print("Error fetching interesting photos: \(error)")
            }
        }
        
    }

    func updateImageView(for photo: Photo) {
        store.fetchImage(for: photo) {
            (imageResult) -> Void in
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
        } }

 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

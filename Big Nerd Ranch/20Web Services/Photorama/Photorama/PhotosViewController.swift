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
            case let .sucess(photos):
                print("sucess")
            case let .failure(error):
                print("failure")
            }
        }
        
    }

 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

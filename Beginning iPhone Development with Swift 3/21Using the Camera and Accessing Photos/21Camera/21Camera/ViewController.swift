import UIKit
import AVKit
import AVFoundation
import MobileCoreServices


class ViewController: UIViewController, UIImagePickerControllerDelegate,
        UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var takePictureButton: UIButton!

    var avPlayerViewController: AVPlayerViewController!
    var image: UIImage?
    var movieURL: URL?
    var lastChosenMediaType: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func imagePickerController(_ picker: UIImagePickerController,
                                       didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        lastChosenMediaType = info[UIImagePickerControllerMediaType] as? String
        if let mediaType = lastChosenMediaType {
            if mediaType == (kUTTypeImage as NSString) as String {
                image = info[UIImagePickerControllerEditedImage] as? UIImage
            } else if mediaType == (kUTTypeMovie as NSString) as String {
                movieURL = info[UIImagePickerControllerMediaURL] as? URL
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion:nil)
    }

}


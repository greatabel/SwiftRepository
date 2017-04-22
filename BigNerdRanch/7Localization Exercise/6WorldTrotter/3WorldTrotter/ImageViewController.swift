import UIKit
import MapKit


class ImageViewController: UIViewController {

    // 课后习题7.19
    // https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPInternational/LocalizingYourApp/LocalizingYourApp.html
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.url(forResource:"index", withExtension: "jpg")
        do{
            let imageData = try Data(contentsOf: path!) as Data
            let advTimeGif = UIImage(data:imageData)
            let imageView2 = UIImageView(image: advTimeGif)
            imageView2.frame = CGRect(x: 20.0, y: 220.0, width: self.view.frame.size.width - 40
                                        , height: 350.0)
            view.addSubview(imageView2)
        }
        catch{
            print("error")
            }
    }
    
}

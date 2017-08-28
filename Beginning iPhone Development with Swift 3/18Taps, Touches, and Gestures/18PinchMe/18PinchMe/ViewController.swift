import UIKit

class ViewController: UIViewController {

    private var imageView:UIImageView!
    private var scale = CGFloat(1)
    private var previousScale = CGFloat(1)
    private var rotation = CGFloat(0)
    private var previousRotation = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "yosemite-meadows")
        imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        imageView.center = view.center
        view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


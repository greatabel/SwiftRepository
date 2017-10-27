import UIKit
import Cartography

class PrettyWeatherViewController: UIViewController {

    private let backgroundView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layoutView()
        style()
        render(image: UIImage(named: "DefaultImage"))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension PrettyWeatherViewController {

    func setup() {
        backgroundView.contentMode = .scaleAspectFit
        backgroundView.clipsToBounds = true
        view.addSubview(backgroundView)
    }

    func layoutView() {
        constrain(backgroundView){
            view in
            view.top == view.superview!.top
            view.bottom == view.superview!.bottom
            view.left == view.superview!.left
            view.right == view.superview!.right
        }
    }

    func render(image: UIImage?){
        if let image = image {
            backgroundView.image = image
        }
    }

    func style(){

    }

}

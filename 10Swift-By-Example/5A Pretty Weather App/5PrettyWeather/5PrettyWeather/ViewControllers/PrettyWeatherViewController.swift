import UIKit
import Cartography

class PrettyWeatherViewController: UIViewController {

    private let backgroundView = UIImageView()

    static var INSET: CGFloat {
        get { return 20 }
    }

    private let scrollView = UIScrollView()
    private let currentWeatherView = CurrentWeatherView(frame: CGRect.zero)


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

        scrollView.showsVerticalScrollIndicator = false
        scrollView.addSubview(currentWeatherView)
        view.addSubview(scrollView)
    }

    func layoutView() {
        constrain(backgroundView) {
            $0.edges ==  $0.superview!.edges
        }

        constrain(scrollView) {
            $0.edges ==  $0.superview!.edges
        }

        constrain(currentWeatherView) {
            $0.width == $0.superview!.width
            $0.centerX == $0.superview!.centerX
        }
        let currentWeahterInsect: CGFloat = view.frame.height
            - CurrentWeatherView.HEIGHT - PrettyWeatherViewController.INSET
        constrain(currentWeatherView) {
            $0.top == $0.superview!.top + currentWeahterInsect
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

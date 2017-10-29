import UIKit
import Cartography

class PrettyWeatherViewController: UIViewController {

    private let backgroundView = UIImageView()

    private let gradientView = UIView()

    static var INSET: CGFloat {
        get { return 20 }
    }

    private let scrollView = UIScrollView()
    private let currentWeatherView = CurrentWeatherView(frame: CGRect.zero)
    private let hourlyForecastView = WeatherHourlyForecastView(frame: CGRect.zero)
    private let daysForecastView = WeatherDaysForecastView(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layoutView()
        style()
        render(image: UIImage(named: "DefaultImage"))
        renderSubViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

private extension PrettyWeatherViewController {

    func setup(){
        backgroundView.contentMode = .scaleAspectFill
        backgroundView.clipsToBounds = true
        view.addSubview(backgroundView)

        view.addSubview(gradientView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.addSubview(currentWeatherView)
        scrollView.addSubview(hourlyForecastView)
        scrollView.addSubview(daysForecastView)
        view.addSubview(scrollView)


    }

    func layoutView() {
        constrain(backgroundView) {
            $0.edges ==  $0.superview!.edges
        }

        constrain(gradientView) {
            $0.edges == $0.superview!.edges
        }

        constrain(scrollView) {
            $0.edges ==  $0.superview!.edges
        }

        constrain(currentWeatherView) {
            $0.width == $0.superview!.width
            $0.centerX == $0.superview!.centerX
        }

        constrain(hourlyForecastView, currentWeatherView) {
            $0.top == $1.bottom + PrettyWeatherViewController.INSET
            $0.width == $0.superview!.width
            $0.centerX == $0.superview!.centerX
        }

        constrain(daysForecastView, hourlyForecastView) {
            $0.top == $1.bottom
            $0.width == $1.width
            $0.bottom == $0.superview!.bottom - PrettyWeatherViewController.INSET
            $0.centerX == $0.superview!.centerX
        }

        let currentWeatherInsect: CGFloat = view.frame.height - CurrentWeatherView.HEIGHT - PrettyWeatherViewController.INSET
        print("### currentWeatherInsect> \(currentWeatherInsect)")
        constrain(currentWeatherView) {
            $0.top == $0.superview!.top + currentWeatherInsect - 200
        }

    }


}

private extension PrettyWeatherViewController{
    func style(){
        // iOS中Layer的坐标系统:
        // http://www.cnblogs.com/YouXianMing/p/3793913.html
        gradientView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientView.bounds

        let blackColor = UIColor(white: 0, alpha: 0.0)
        let clearColor = UIColor(white: 0, alpha: 1.0)

        gradientLayer.colors = [blackColor.cgColor, clearColor.cgColor]
        gradientLayer.startPoint = CGPoint(x:1.0,y:0.5)
        gradientLayer.endPoint = CGPoint(x:1.0, y:1.0)
        gradientView.layer.mask = gradientLayer

    }
}

private extension PrettyWeatherViewController{
    func render(image: UIImage?){
        if let image = image {
            backgroundView.image = image
        }
    }

    func renderSubViews() {
        currentWeatherView.render()
    }
}

import WeatherIconsKit
import Cartography

class WeatherHourForecastView: UIView {


    private var didSetupConstraints = false

    private let iconLabel = UILabel()
    private let hourLabel = UILabel()
    private let tempsLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        style()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        if didSetupConstraints {
            super.updateConstraints()
            return
        }
        layoutView()
        super.updateConstraints()
        didSetupConstraints = true
    }

}

private extension WeatherHourForecastView {
    func setup() {
        addSubview(iconLabel)
        addSubview(hourLabel)
        addSubview(tempsLabel)
    }
}
private extension WeatherHourForecastView{
    func layoutView(){
        constrain(iconLabel) {
            $0.center == $0.superview!.center
            $0.height == 50
        }

        constrain(hourLabel){
            $0.centerX == $0.superview!.centerX
            $0.top == $0.superview!.top
        }

        constrain(tempsLabel){
            $0.centerX == $0.superview!.centerX
            $0.bottom == $0.superview!.bottom
        }
    }
}
private extension WeatherHourForecastView {
    func style() {
//        backgroundColor = UIColor.blue

        iconLabel.textColor = UIColor.white
        hourLabel.font = UIFont.latoFont(ofSize: 20)
        hourLabel.textColor = UIColor.white
        tempsLabel.font = UIFont.latoFont(ofSize: 20)
        tempsLabel.textColor = UIColor.white
    }
}

extension WeatherHourForecastView{
    func render() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        hourLabel.text = dateFormatter.string(from: Date())
        iconLabel.attributedText = WIKFontIcon.wiDaySunnyIcon(withSize: 30)
                                              .attributedString()
        let number = arc4random_uniform(11) // [0, 10]
        let temp = "\(number - 1) ° \(number + 3) °"
        tempsLabel.text = temp
    }
}



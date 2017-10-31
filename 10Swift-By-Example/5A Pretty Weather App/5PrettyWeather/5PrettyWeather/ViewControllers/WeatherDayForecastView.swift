import WeatherIconsKit
import Cartography

class WeatherDayForecastView: UIView {

    private var didSetupConstraints = false

    private let iconLabel = UILabel()
    private let dayLabel = UILabel()
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

private extension WeatherDayForecastView {
    func setup() {
        addSubview(dayLabel)
        addSubview(iconLabel)
        addSubview(tempsLabel)
    }
}
private extension WeatherDayForecastView{
    func layoutView(){
        constrain(self) {
            $0.height == 50
        }
        constrain(iconLabel) {
            $0.centerY == $0.superview!.centerY
            $0.left == $0.superview!.left + 20
            $0.width == $0.height
            $0.height == 50
        }
        constrain(dayLabel, iconLabel) {
            $0.centerY == $0.superview!.centerY
            $0.left == $1.right + 20

        }
        constrain(tempsLabel){
            $0.centerY == $0.superview!.centerY
            $0.right == $0.superview!.right - 20
        }
    }
}
private extension WeatherDayForecastView {
    func style() {
        iconLabel.textColor = UIColor.white
        dayLabel.font = UIFont.latoFont(ofSize: 20)
        dayLabel.textColor = UIColor.white
        tempsLabel.font = UIFont.latoFont(ofSize: 20)
        tempsLabel.textColor = UIColor.white
    }

}

extension WeatherDayForecastView{
    func render() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dayLabel.text = dateFormatter.string(from: Date())
        iconLabel.attributedText = WIKFontIcon.wiDaySunnyIcon(withSize: 30).attributedString()

        tempsLabel.text = "7°     11°"

    }
}




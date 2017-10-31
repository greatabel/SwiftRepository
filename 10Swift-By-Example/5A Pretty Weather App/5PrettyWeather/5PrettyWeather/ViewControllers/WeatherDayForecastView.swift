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

    }
}




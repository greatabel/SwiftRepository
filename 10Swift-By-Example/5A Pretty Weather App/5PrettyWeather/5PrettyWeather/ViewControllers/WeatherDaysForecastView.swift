import UIKit
import Cartography

class WeatherDaysForecastView: UIView {

    static var HEIGHT: CGFloat {
        get { return 300 }
    }
    private var didSetupConstraints = false

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

private extension WeatherDaysForecastView {
    func setup() {

    }
}
private extension WeatherDaysForecastView {
    func layoutView() {
        constrain(self) {
            $0.height == CurrentWeatherView.HEIGHT
        }
    }
}
private extension WeatherDaysForecastView {
    func style() {
        backgroundColor = UIColor.blue
    }
}


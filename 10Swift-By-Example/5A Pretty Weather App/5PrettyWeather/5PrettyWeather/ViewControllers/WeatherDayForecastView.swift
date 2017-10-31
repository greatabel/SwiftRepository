import WeatherIconsKit
import Cartography

class WeatherDayForecastView: UIView {

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

private extension WeatherDayForecastView {
    func setup() {

    }
}
private extension WeatherDayForecastView{
    func layoutView(){

    }
}
private extension WeatherDayForecastView {
    func style() {
        


    }
}

extension WeatherDayForecastView{
    func render() {

    }
}




import UIKit
import Cartography

class WeatherHourForecastView: UIView {


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

private extension WeatherHourForecastView {
    func setup() {

    }
}
private extension WeatherHourForecastView{
    func layoutView(){
  
    }
}
private extension WeatherHourForecastView {
    func style() {
        backgroundColor = UIColor.blue
    }
}



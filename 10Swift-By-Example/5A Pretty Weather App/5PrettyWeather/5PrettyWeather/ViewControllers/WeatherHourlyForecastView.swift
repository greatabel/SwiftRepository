import UIKit
import Cartography

class WeatherHourlyForecastView: UIView {

    static var HEIGHT: CGFloat {
        get { return 60 }
    }
    private var didSetupConstraints = false

    private let scrollView = UIScrollView()
    private var forecastCells = Array<WeatherHourForecastView>()

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

private extension WeatherHourlyForecastView {
    func setup() {
        (0..<7).forEach {
            _ in
            let cell = WeatherHourForecastView(frame: CGRect.zero)
            forecastCells.append(cell)
        }
        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
    }
}
private extension WeatherHourlyForecastView{
    func layoutView(){
        constrain(self) { view in
            view.height == WeatherHourlyForecastView.HEIGHT
            return
        }
    }
}

private extension WeatherHourlyForecastView {
    func style() {
        backgroundColor = UIColor.green
    }
}


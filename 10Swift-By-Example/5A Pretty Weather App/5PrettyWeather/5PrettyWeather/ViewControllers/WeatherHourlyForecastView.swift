import UIKit
import Cartography

class WeatherHourlyForecastView: UIView {

//    static var HEIGHT: CGFloat {
//        get { return 60 }
//    }
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
            scrollView.addSubview(cell)
        }
        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
    }
}
private extension WeatherHourlyForecastView{
    func layoutView(){
        constrain(self) {
            $0.height == 100
        }
        constrain(scrollView) {
            $0.edges == $0.superview!.edges
        }
        constrain(forecastCells.first!){
            $0.left == $0.superview!.left
        }
        constrain(forecastCells.last!){
            $0.right == $0.superview!.right
        }
        for idx in 0..<(forecastCells.count - 1) {
            print("idx> \(idx)")
            let cell = forecastCells[idx]
            let nextCell = forecastCells[idx + 1]
            constrain(cell, nextCell) {
                $0.right == $1.left + 5
            }
        }
        forecastCells.forEach{ cell in
            constrain(cell){
                $0.width == $0.height
                $0.height == $0.superview!.height
                $0.top == $0.superview!.top
            }
        }

    }
}

private extension WeatherHourlyForecastView {
    func style() {
//        backgroundColor = UIColor.green


    }
}

extension WeatherHourlyForecastView {
    func render() {
        forecastCells.forEach {
            $0.render()
        }
    }

}


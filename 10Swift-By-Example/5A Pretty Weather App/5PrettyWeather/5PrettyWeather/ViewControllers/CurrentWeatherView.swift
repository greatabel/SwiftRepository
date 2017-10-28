import UIKit
import Cartography
import LatoFont
import WeatherIconsKit

class CurrentWeatherView: UIView {

    static var HEIGHT: CGFloat {
        get { return 160 }
    }
    private var didSetupConstraints = false

    private let cityLbl = UILabel()
    private let maxTempLbl = UILabel()
    private let minTempLbl = UILabel()

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

private extension CurrentWeatherView {
    func setup() {
        addSubview(cityLbl)
        addSubview(maxTempLbl)
        addSubview(minTempLbl)

    }
}
private extension CurrentWeatherView {
    func layoutView() {
        constrain(self) {
            $0.height == CurrentWeatherView.HEIGHT
        }

        constrain(cityLbl) {
            $0.bottom == $0.superview!.bottom
            $0.right == $0.superview!.right - 10
            $0.height == 30
            $0.width == 200
        }
        constrain(minTempLbl){
            $0.bottom == $0.superview!.bottom
            $0.height == 30
        }
        constrain(maxTempLbl, minTempLbl){
            $0.top == $1.top
            $0.height == $1.height
            $0.left == $1.right + 10
        }
    }
}

private extension CurrentWeatherView {
    func style() {
//        backgroundColor = UIColor.red

        maxTempLbl.font = UIFont.latoLightFont(ofSize: 18)
        maxTempLbl.textColor = UIColor.white

        minTempLbl.font = UIFont.latoLightFont(ofSize: 18)
        minTempLbl.textColor = UIColor.white

        cityLbl.font = UIFont.latoLightFont(ofSize: 18)
        cityLbl.textColor = UIColor.white
        cityLbl.textAlignment = .right
    }
}

extension CurrentWeatherView{
    func render(){

        minTempLbl.text = "14°"
        maxTempLbl.text = "20°"

        cityLbl.text = "Wuhan"
    }
}

import UIKit
import Cartography

class CurrentWeatherView: UIView {

    static var HEIGHT: CGFloat {
        get { return 160 }
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

private extension CurrentWeatherView {
    func setup() {

    }
}
private extension CurrentWeatherView {
    func layoutView() {
        constrain(self) {
            $0.height == CurrentWeatherView.HEIGHT
        }
    }
}
private extension CurrentWeatherView {
    func style() {
        backgroundColor = UIColor.red
    }
}

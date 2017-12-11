import UIKit

class ThermostatSlider: UIControl {

    var maxValue:Float = 1.0
    var value:Float {
        get { return _value}
        set (newValue){
            if newValue >= 0{
                _value = min(newValue, maxValue)
            }else{
                _value = max(newValue, -maxValue)
            }

            // Avoid animations
            CATransaction.begin()
            CATransaction.setAnimationDuration(0)
            updateHandle()
            updateTrack()
            CATransaction.commit()

            self.sendActions(for: UIControlEvents.valueChanged)
        }
    }

    @objc dynamic var hotTrackColor = UIColor(red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0)
    @objc dynamic var coldTrackColor = UIColor(red: 0.4, green: 0.6, blue: 1.0, alpha: 1.0)

    private var _value:Float = 0.0

    private func updateHandle(){

    }

    private func updateTrack(){

    }

}

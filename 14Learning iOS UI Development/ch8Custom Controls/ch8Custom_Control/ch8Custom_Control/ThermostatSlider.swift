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

    private var borderLayer = CALayer()
    private var trackLayer = CALayer()
    private var handleLayer = CALayer()

    override init(frame:CGRect){

        super.init(frame:frame)
        designBorders()
        designTrack()
        designHandle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }

    private func designBorders(){

        borderLayer.backgroundColor = UIColor.white.cgColor
        borderLayer.borderColor = UIColor(white: 0.9, alpha: 1.0).cgColor
        borderLayer.borderWidth = 1
        borderLayer.masksToBounds = true

        layer.addSublayer(borderLayer)
    }

    private func designHandle(){

        handleLayer.backgroundColor = UIColor.white.cgColor
        handleLayer.shadowColor = UIColor.black.cgColor
        handleLayer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        handleLayer.shadowRadius = 2
        handleLayer.shadowOpacity = 0.3
        handleLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)

        self.layer.addSublayer(handleLayer)
    }

    private func designTrack(){

        trackLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        borderLayer.addSublayer(trackLayer)
    }


    override func layoutSubviews() {

        super.layoutSubviews()
        updateBorder()
        updateHandle()
        updateTrack()

    }

    private func updateBorder(){

        borderLayer.frame = bounds
        borderLayer.cornerRadius = bounds.size.width / 2.0
    }

    private func updateHandle(){

        // Update size and radius depending on control width
        let controlWidth = bounds.size.width

        handleLayer.bounds.size = CGSize(
            width: controlWidth,
            height: controlWidth)
        handleLayer.cornerRadius = controlWidth / 2.0

        // Update handle position depending on value
        var position = borderLayer.position
        if value != 0 {
            position.y -= valueToY()
        }
        handleLayer.position = position
    }

    private func updateTrack(){

        // Define track size
        trackLayer.frame = CGRect(x:0, y:0, width:self.bounds.width, height:0)
        trackLayer.position = CGPoint(
            x: bounds.size.width/2,
            y: bounds.size.height/2)

        // Update layer height depending on value
        trackLayer.bounds.size.height = abs(valueToY())

        // Update anchor point and color depending on value
        if value >= 0{
            trackLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
            trackLayer.backgroundColor = hotTrackColor.cgColor
        } else {
            trackLayer.anchorPoint = CGPoint(x: 0.5, y: 0)
            trackLayer.backgroundColor = coldTrackColor.cgColor
        }

    }

    private func valueToY()->CGFloat{
        return CGFloat(value) / CGFloat(maxValue) * (bounds.size.height - handleLayer.bounds.size.height / 2.0) / 2
    }

    // Set the value for the given Y absolute coordinate
    private func valueFromY(y:CGFloat)->Float{
        let cleanY = min(max(0, y), bounds.size.height)
        let trackHalfHeight = bounds.size.height / 2.0
        let translatedY = trackHalfHeight - cleanY

        return Float(translatedY) * maxValue / Float(trackHalfHeight)
    }

    // MARK: Touch Tracking ------------------------------------------------------------- **

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool{

        self.handleLayer.transform = CATransform3DMakeScale(1.5, 1.5, 1)
        let point = touch.location(in: self)
        value = valueFromY(y: point.y)
        self.isHighlighted = true

        for t in allTargets{
            print(actions(forTarget: t, forControlEvent: UIControlEvents.valueChanged)!)
        }
        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let point = touch.location(in: self)
        value = valueFromY(y: point.y)

        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        self.handleLayer.transform = CATransform3DIdentity
        self.isHighlighted = false

    }

    override func cancelTracking(with event: UIEvent?) {
        self.handleLayer.transform = CATransform3DIdentity
        self.isHighlighted = false
    }

}

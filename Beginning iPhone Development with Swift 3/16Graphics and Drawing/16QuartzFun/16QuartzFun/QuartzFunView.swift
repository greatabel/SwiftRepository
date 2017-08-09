import UIKit

extension UIColor {
    class func randomColor() -> UIColor
    {
        let red = CGFloat(Double(arc4random_uniform(255))/255)
        let green = CGFloat(Double(arc4random_uniform(255))/255)
        let blue = CGFloat(Double(arc4random_uniform(255))/255)
        return UIColor(red: red, green: green, blue: blue, alpha:1.0)
    }
}

enum  Shape: UInt {
    case line = 0, rect, ellipse, image
}

enum DrawingColor: UInt {
    case red = 0, blue, yellow, green, random
}

class QuartzFunView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    // Application-settable properties
    var shape = Shape.line
    var currentColor = UIColor.red
    var useRandomColor = false

    // Internal properties
    private let image = UIImage(named:"iphone")
    private var firstTouchLocation = CGPoint.zero
    private var lastTouchLocation = CGPoint.zero
    private var redrawRect = CGRect.zero

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

}





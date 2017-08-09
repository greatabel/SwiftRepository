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
class QuartzFunView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

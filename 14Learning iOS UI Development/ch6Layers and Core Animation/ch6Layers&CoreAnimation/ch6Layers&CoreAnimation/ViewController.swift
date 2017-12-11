import UIKit

class ViewController: UIViewController {

    let roundedLayer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        // Layer setup
        roundedLayer.backgroundColor = UIColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        roundedLayer.cornerRadius = 20
        roundedLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        roundedLayer.position = CGPoint(x: 60, y: 100)
        view.layer.addSublayer(roundedLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateLayer(_ sender: Any) {
        positionAnimation()
        keyframeAnimation()
        groupAnimation()
    }

    func keyframeAnimation(){
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.values = [
            roundedLayer.backgroundColor!,
            UIColor.green.cgColor,
            UIColor.blue.cgColor,
            UIColor.blue.cgColor,
            UIColor.yellow.cgColor
        ]
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false

        animation.keyTimes = [0, 0.2, 0.8, 1]
        animation.duration = 10
        roundedLayer.add(animation, forKey: "Colors")
    }

    func positionAnimation(){

        // Position animation
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = 60
        animation.toValue = 200
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.repeatCount = 3
        animation.autoreverses = true

        roundedLayer.add(animation, forKey: "Move")
    }

    func groupAnimation(){

        // Opacity
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0

        // Scale
        let scaleAnimation = CABasicAnimation(keyPath: "transform")
        let scale = CATransform3DMakeScale(0.5, 0.5, 1.0)
        scaleAnimation.fromValue = CATransform3DMakeScale(0.5, 1, 0)
        scaleAnimation.toValue = scale
//        scaleAnimation.fromValue = NSValue(CATransform3D: CATransform3DIdentity)
//        scaleAnimation.toValue = NSValue(CATransform3D: scale)

        //Group
        let group = CAAnimationGroup()
        group.animations = [opacityAnimation, scaleAnimation]
        group.duration = 1.0
        group.repeatCount = 2
        group.autoreverses = true

        roundedLayer.add(group, forKey: "HeartBeat")
    }
    
}


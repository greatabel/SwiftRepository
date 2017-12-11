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
        keyframeAnimation()
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
    
}


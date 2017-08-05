import UIKit

class ViewController: UIViewController {

    private var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bounds = view.bounds
        let labelFrame = CGRect(origin: CGPoint(x: bounds.origin.x, y:bounds.midY - 50),
                                size: CGSize(width: bounds.size.width, height: 100))
        label = UILabel(frame: labelFrame)
        label.font = UIFont(name: "Helvetica", size:70)
        label.text = "嘿嘿!"
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        view.addSubview(label)
        rotateLabelDown();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func rotateLabelDown() {
        UIView.animate(withDuration: 0.5, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        },
                       completion: {(Bool) -> Void in
                        self.rotateLabelUp()
        } )
    }

    func rotateLabelUp() {
        UIView.animate(withDuration: 0.5, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: 0)
        },
                       completion: {(Bool) -> Void in
                        self.rotateLabelDown()
        } )
    }



}


import UIKit

class ViewController: UIViewController {

    private var label: UILabel!
    private var smiley: UIImage!
    private var smileyView: UIImageView!

    private var animate = false

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

        // smiley.png is 84 x 84
        let smileyFrame = CGRect(x: bounds.midX - 42,
                                 y: bounds.midY/2 - 42, width: 84, height: 84)
        smileyView = UIImageView(frame:smileyFrame)
        smileyView.contentMode = UIViewContentMode.center
        let smileyPath =
            Bundle.main.path(forResource: "smiley", ofType: "png")!
        smiley = UIImage(contentsOfFile: smileyPath)
        smileyView.image = smiley
        view.addSubview(smileyView)
        
        view.addSubview(label)
//        rotateLabelDown()

        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(ViewController.applicationWillResignActive),
                           name: Notification.Name.UIApplicationWillResignActive, object: nil)
        center.addObserver(self, selector: #selector(ViewController.applicationDidBecomeActive),
                           name: Notification.Name.UIApplicationDidBecomeActive, object: nil)

    }

    func applicationWillResignActive() {
        print("VC: \(#function)")
        animate = false
    }

    func applicationDidBecomeActive() {
        print("VC: \(#function)")
        animate = true
        rotateLabelDown()
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
                        if self.animate {
                            self.rotateLabelDown()
                        }
        } )
    }



}


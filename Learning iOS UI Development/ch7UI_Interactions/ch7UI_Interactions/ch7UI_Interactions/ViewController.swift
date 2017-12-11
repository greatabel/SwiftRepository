import UIKit

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        redView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        redView?.backgroundColor = UIColor.red
        redView?.center = view.center
        view.addSubview(redView!)

        // Initialize and attach the gesture
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        view.addGestureRecognizer(pinchGR)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func pinch(gesture:UIPinchGestureRecognizer){
        print(#function)
        // Handle different gesture states
        switch gesture.state {

        case .began:
            redView?.layer.transform = CATransform3DIdentity

        case .changed:
            //Apply transform
            let transform = CATransform3DMakeScale(gesture.scale, gesture.scale, 0)
            redView?.layer.transform = transform

        default:
            // Reset the original position
            UIView.animate(withDuration: 0.2, animations: { () -> Void in
                self.redView?.layer.transform = CATransform3DIdentity
            })
        }
    }

}


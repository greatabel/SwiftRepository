import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    private var imageView:UIImageView!
    private var scale = CGFloat(1)
    private var previousScale = CGFloat(1)
    private var rotation = CGFloat(0)
    private var previousRotation = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "yosemite-meadows")
        imageView = UIImageView(image: image)
        imageView.isUserInteractionEnabled = true
        imageView.center = view.center
        view.addSubview(imageView)

        let pinchGesture = UIPinchGestureRecognizer(target: self,
                                        action: #selector(ViewController.doPinch(_:)))
        pinchGesture.delegate = self
        imageView.addGestureRecognizer(pinchGesture)

        let rotationGesture = UIRotationGestureRecognizer(target: self,
                                      action: #selector(ViewController.doRotate(_:)))
        rotationGesture.delegate = self
        imageView.addGestureRecognizer(rotationGesture)

    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith
                            otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    func doPinch(_ gesture:UIPinchGestureRecognizer) {
        scale = gesture.scale
        transformImageView()
        if gesture.state == .ended {
            previousScale = scale * previousScale
            scale = 1
        }
    }

    func transformImageView() {
        let rotate = CGAffineTransform(rotationAngle: rotation + previousRotation)
        let stretchAndRotate = rotate.scaledBy(x: scale * previousScale, y: scale * previousScale)
        imageView.transform = stretchAndRotate
    }

    func doRotate(_ gesture:UIRotationGestureRecognizer) {
        rotation = gesture.rotation
        transformImageView()
        if gesture.state == .ended {
            previousRotation = rotation + previousRotation
            rotation = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}


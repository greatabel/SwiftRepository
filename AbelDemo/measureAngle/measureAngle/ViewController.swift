import UIKit
import CoreMotion

/*
 http://nshipster.com/cmdevicemotion/
https://stackoverflow.com/questions/24728022/obtain-absolute-rotation-using-cmdevicemotion

 */

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!

    @IBOutlet var imageView: UIImageView!

//    let interval = 0.01
    let interval = 3.0
    let imageFilename = "bg.jpg"
    let imageWidth = CGFloat(800)
    let imageHeight = CGFloat(1200)

    let manager = CMMotionManager()



    override func viewDidLoad() {
        super.viewDidLoad()

        guard manager.isDeviceMotionAvailable else { return }

        setImageView()

        manager.deviceMotionUpdateInterval = interval
        let queue = OperationQueue()

        manager.startDeviceMotionUpdates(to: queue, withHandler: {(data, error) in
            guard let data = data else { return }

            let gravity = data.gravity
            let rotation = atan2(gravity.x, gravity.y) - .pi

            OperationQueue.main.addOperation {
                if let attitude = self.manager.deviceMotion?.attitude {
//                    let y = CGFloat(-attitude.pitch * 2 / M_PI)
//                    let x = CGFloat(-attitude.roll * 2 / M_PI)
//                    let str = y.description + ", " + x.description
                    self.myLabel.text = attitude.pitch.description
                }

                self.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
            }
        })
    }

    func setImageView() {
        if let img = UIImage(named: imageFilename) {
            let iv = UIImageView(image: img)

            // center the image
            let x = (self.view.frame.width/2)-(imageWidth/2)
            let y = (self.view.frame.height/2)-(imageHeight/2)
            iv.frame = CGRect(x: x, y: y, width: imageWidth, height: imageHeight)

            self.view.addSubview(iv)
            self.imageView = iv
        }
    }



}


import UIKit
import CoreMotion


class ViewController: UIViewController {

    private static let updateInterval = 1.0/60.0
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        motionManager.startDeviceMotionUpdates(to: queue, withHandler: {_,_ in
            let ballView = self.view as! BallView
            //            ballView.acceleration = motionData!.gravity
            DispatchQueue.main.async {
                ballView.update()
            }

        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


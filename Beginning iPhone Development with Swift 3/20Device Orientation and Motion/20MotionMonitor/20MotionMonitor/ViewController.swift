import UIKit
import CoreMotion


class ViewController: UIViewController {

    @IBOutlet var gyroscopeLabel: UILabel!
    @IBOutlet var accelerometerLabel: UILabel!
    @IBOutlet var attitudeLabel: UILabel!
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


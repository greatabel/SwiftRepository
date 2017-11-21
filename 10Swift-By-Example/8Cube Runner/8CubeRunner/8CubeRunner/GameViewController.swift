import UIKit
import QuartzCore
import SceneKit
import CoreMotion

class GameViewController: UIViewController {
    private let scnView = SCNView()
    private var scene: SCNScene!
    private var cameraNode: SCNNode!
    //...
    private var motionManager : CMMotionManager?
    //...
    override func viewDidLoad() {
        super.viewDidLoad()
        scnView.frame = view.bounds
        view.addSubview(scnView)

        createContents()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

private extension GameViewController {
    func createContents() {

    }
}

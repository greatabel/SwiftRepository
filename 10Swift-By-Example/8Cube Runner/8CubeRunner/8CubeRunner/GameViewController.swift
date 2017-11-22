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
        scene = SCNScene(named: "art.scnassets/eurofighter.dae")
        scene.background.contents = UIImage(named: "sky")
        scnView.showsStatistics = true

        cameraNode = createCamera()
        scene.rootNode.addChildNode(cameraNode)


        scnView.scene = scene
    }

    func createCamera() -> SCNNode{
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 7, 20)
        cameraNode.rotation = SCNVector4Make(1, 0, 0, -atan2f(7, 20.0))
        return cameraNode
    }
}

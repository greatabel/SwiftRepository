import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = Bundle.main.path(forResource: file as String, ofType: "sks") {
            let sceneData = try! NSData(contentsOfFile: path, options: .mappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWith: sceneData as Data)

            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObject(forKey: NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {

    private let skView = SKView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        skView.frame = view.bounds
        view.addSubview(skView)
        createTheScene()
    }

    private func createTheScene() {

        if let scene = GameScene.unarchiveFromFile(file: "GameScene") as? GameScene {
            scene.size = skView.frame.size
            skView.showsFPS = true
            skView.showsNodeCount = true

            skView.ignoresSiblingOrder = true
//            skView.showsPhysics = true

            scene.scaleMode = .aspectFill

            scene.onPlayAgainPressed = {[weak self] in
                self?.createTheScene()
            }

            scene.onCancelPressed = {[weak self] in
                self?.dismiss(animated: true, completion: nil)
            }
            skView.presentScene(scene)
        }
    }



}

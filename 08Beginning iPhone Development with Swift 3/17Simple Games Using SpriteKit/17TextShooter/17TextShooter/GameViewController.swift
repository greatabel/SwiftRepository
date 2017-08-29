import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.frame.size, levelNumber: 1)

        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true

        skView.ignoresSiblingOrder = true

        scene.scaleMode = .aspectFill

        skView.presentScene(scene)
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
}

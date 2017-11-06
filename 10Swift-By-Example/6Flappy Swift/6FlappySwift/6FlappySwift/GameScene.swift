import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var screenNode: SKSpriteNode!
    private var actors: [Startable]!
    
    override func didMove(to view: SKView) {
        
        screenNode = SKSpriteNode(color: UIColor.clear, size: self.size)
        screenNode.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(screenNode)

//        let sky = Backgrand(textureNamed: "sky", duration: 60.0).addTo(screenNode, zPosition: 0)
    }

}

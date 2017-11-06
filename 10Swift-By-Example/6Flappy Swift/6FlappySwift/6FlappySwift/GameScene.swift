import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var screenNode: SKSpriteNode!
    private var bird: Bird!
    private var actors: [Startable]!
    
    override func didMove(to view: SKView) {
        
        screenNode = SKSpriteNode(color: UIColor.clear, size: self.size)
        screenNode.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(screenNode)

        let sky = Background(textureNamed: "sky", duration: 60.0)
                    .addTo(parentNode: screenNode, zPosition: 0)
        let city = Background(textureNamed: "city", duration:20.0)
                    .addTo(parentNode: screenNode, zPosition: 1)
        let ground = Background(textureNamed: "ground", duration:5.0)
                    .addTo(parentNode: screenNode, zPosition: 2)
        actors = [sky, city, ground, bird]
        for actor in actors {
            actor.start()
        }
    }

}

import SpriteKit
import GameplayKit

enum BodyType : UInt32 {
    case bird = 0b0001
    case ground = 0b0010
    case pipe = 0b0100
    case gap = 0b1000
}

class GameScene: SKScene {
    
    private var screenNode: SKSpriteNode!
    private var bird: Bird!
    private var actors: [Startable]!
    
    override func didMove(to view: SKView) {
        
        physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        physicsWorld.contactDelegate = self

        screenNode = SKSpriteNode(color: UIColor.clear, size: self.size)
        screenNode.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(screenNode)

        let sky = Background(textureNamed: "sky", duration: 60.0)
                    .addTo(parentNode: screenNode, zPosition: 0)
        let city = Background(textureNamed: "city", duration:20.0)
                    .addTo(parentNode: screenNode, zPosition: 1)
        let ground = Background(textureNamed: "ground", duration:5.0)
                    .addTo(parentNode: screenNode, zPosition: 2)
        ground.zPosition(zPosition: 5)
        screenNode.addChild(bodyTextureName(textureName: "ground"))

        bird = Bird(textureNames: ["bird1.png", "bird2.png"]).addTo(scene: screenNode)
        bird.position = CGPoint(x: 30.0, y: 400.0)
        let pipes = Pipes(topPipeTexture: "topPipe.png",
                          bottomPipeTexture: "bottomPipe").addTo(parentNode: screenNode)

        actors = [sky, city, ground, bird, pipes]
        for actor in actors {
            actor.start()
        }
    }

    override func update(_ currentTime: CFTimeInterval) {
        bird.update()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bird.flap()
    }

}

private extension GameScene{
    func bodyTextureName(textureName: String) -> SKNode{
        let image = UIImage(named: textureName)
        let width = image!.size.width
        let height = image!.size.height
        let groundBody = SKNode()
        groundBody.position = CGPoint(x: width/2, y: height/2)

        groundBody.physicsBody = SKPhysicsBody.rectSize(size: CGSize(width: width, height: height))
        { body in
            body.isDynamic = false
            body.affectedByGravity = false
            body.categoryBitMask = BodyType.ground.rawValue
            body.collisionBitMask = BodyType.ground.rawValue
        }

        return groundBody
    }
}


extension GameScene: SKPhysicsContactDelegate {
    // https://stackoverflow.com/questions/26654039/didbegincontact-not-called
    func  didBegin(_ contact: SKPhysicsContact) {
        print(#function)
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch (contactMask) {
        case BodyType.pipe.rawValue |  BodyType.bird.rawValue:
            print("Contact with a pipe")
//            for actor in actors {
//                actor.stop()
//            }
        case BodyType.ground.rawValue | BodyType.bird.rawValue:
            print("Contact with ground")
            for actor in actors {
                actor.stop()
            }
        default:
            return
        }

    }
    func  didEnd(_ contact: SKPhysicsContact) {

//        print(#function)
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

        switch (contactMask) {
        case BodyType.gap.rawValue |  BodyType.bird.rawValue:
            print("Contact with gap")
        default:
            return
        }
    }
}

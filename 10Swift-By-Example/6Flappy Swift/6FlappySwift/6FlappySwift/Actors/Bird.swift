import SpriteKit

class Bird : Startable {
    private var node: SKSpriteNode!
    private let textureNames: [String]

    var position: CGPoint {
        set { node.position = newValue }
        get { return node.position }
    }

    init(textureNames: [String]) {
        self.textureNames = textureNames
        node = createNode()
    }
    func addTo(scene: SKSpriteNode) -> Bird{
        scene.addChild(node)
        return self
    }
}

private extension Bird {
    func createNode() -> SKSpriteNode {
        let birdNode = SKSpriteNode(imageNamed: textureNames.first!)
        birdNode.zPosition = 2.0
        birdNode.physicsBody = SKPhysicsBody.init(rectangleOf: birdNode.size)
        birdNode.physicsBody!.isDynamic = true

        return birdNode
    }
}

extension Bird {
    func start() {
//        animate()
    }

    func stop() {
//        node.physicsBody!.dynamic = false
//        node.removeAllActions()
    }
}

extension Bird {
    func flap() {
        node.physicsBody!.velocity = CGVector(dx: 0, dy: 0)
        node.physicsBody!.applyImpulse(CGVector(dx: 0, dy: 8))
    }

    func update() {
        switch node.physicsBody!.velocity.dy {
        case let dy where dy > 30.0:
            node.zRotation = (3.14/6.0)
        case let dy where dy < -100.0:
            node.zRotation = -1*(3.14/4.0)
        default:
            node.zRotation = 0.0
        }
    }
}

extension Bird {
    private func animate(){
        let animationFrames = textureNames.map { texName in
            SKTexture(imageNamed: texName)
        }

        node.run(
            SKAction.repeatForever(
                SKAction.animate(with: animationFrames, timePerFrame: 0.5)
        ))
    }
}

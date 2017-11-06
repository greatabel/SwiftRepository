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

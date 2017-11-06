import SpriteKit

class ParallaxNode {
    private let node: SKSpriteNode!

    init(textureNamed: String) {
        let leftHalf = createHalfNodeTexture(textureNamed: textureNamed, offsetX: 0)
        let rightHalf = createHalfNodeTexture(textureNamed: textureNamed, offsetX: leftHalf.size.width)
        print("leftHalf.size=\(leftHalf.size)")
        let size = CGSize(width: leftHalf.size.width + rightHalf.size.width,
                          height: leftHalf.size.height )

        node = SKSpriteNode(color: UIColor.clear, size: size)
        node.anchorPoint = CGPoint.zero
        node.position = CGPoint.zero
        node.addChild(leftHalf)
        node.addChild(rightHalf)
    }

    func zPosition(zPosition: CGFloat) -> ParallaxNode {
        node.zPosition = zPosition
        return self
    }

    func addTo(parentNode: SKSpriteNode, zPosition: CGFloat) -> ParallaxNode {
        parentNode.addChild(node)
        node.zPosition = zPosition
        return self
    }
}
extension ParallaxNode {
    func start(duration: TimeInterval) {
        node.run(SKAction.repeatForever(SKAction.sequence(
            [
                SKAction.moveTo(x: -node.size.width/2.0, duration: duration),
                SKAction.moveTo(x: 0, duration: 0)
            ]
        )))
    }

    func stop() {
        node.removeAllActions()
    }
}


private func createHalfNodeTexture(textureNamed: String, offsetX: CGFloat) -> SKSpriteNode {
    let node = SKSpriteNode(imageNamed: textureNamed, normalMapped: true)
    node.anchorPoint = CGPoint.zero
    node.position = CGPoint(x: offsetX, y: 0)
    return node
}

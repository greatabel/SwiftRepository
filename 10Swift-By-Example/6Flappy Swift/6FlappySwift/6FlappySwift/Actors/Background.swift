import SpriteKit

class Background {
    private let parallaxNode: ParallaxNode
    private let duration: Double

    init(textureNamed textureName: String, duration: Double) {
        parallaxNode = ParallaxNode(textureNamed: textureName)
        self.duration = duration
    }

    func addTo(parentNode: SKSpriteNode, zPosition: CGFloat) -> Self {
        let result = parallaxNode.addTo(parentNode: parentNode, zPosition: zPosition)
        print(result)
        return self
    }

}

extension Background : Startable {
    func start() {
        parallaxNode.start(duration: duration)
    }

    func stop() {
        parallaxNode.stop()
    }
}

import SpriteKit

class Pipes {

    private class var createActionKey : String { get {return "createActionKey"} }
    private var parentNode: SKSpriteNode!
    private let topPipeTexture: String
    private let bottomPipeTexture: String

    init(topPipeTexture: String, bottomPipeTexture: String) {
        self.topPipeTexture = topPipeTexture
        self.bottomPipeTexture = bottomPipeTexture
    }
    
    func addTo(parentNode: SKSpriteNode) -> Pipes {
        self.parentNode = parentNode
        return self
    }

}

private extension Pipes {
    func createNewPipesNode() {
        PipesNode(topPipeTexture: topPipeTexture, bottomPipeTexture:bottomPipeTexture, centerY: centerPipes()).addTo(parentNode: parentNode).start()
    }

    func centerPipes() -> CGFloat {
        return parentNode.size.height/2 - 100 + 20 * CGFloat(arc4random_uniform(10))
    }
}

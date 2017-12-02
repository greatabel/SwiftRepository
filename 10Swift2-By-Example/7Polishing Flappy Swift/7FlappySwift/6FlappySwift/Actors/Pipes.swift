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

extension Pipes : Startable {
    func start() {
        let createAction = SKAction.repeatForever(
            SKAction.sequence(
                [
                    SKAction.run {
                        self.createNewPipesNode()
                    },
                    SKAction.wait(forDuration: 3)
                ]
        ) )

        parentNode.run(createAction, withKey: Pipes.createActionKey)
    }

    func stop() {
        parentNode.removeAction(forKey: Pipes.createActionKey)

        let pipeNodes = parentNode.children.filter {
            $0.name == PipesNode.kind
        }
        for pipe in pipeNodes {
            pipe.removeAllActions()
        }
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

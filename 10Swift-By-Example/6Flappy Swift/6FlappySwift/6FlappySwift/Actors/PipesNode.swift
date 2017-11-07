import SpriteKit

class PipesNode{
    class var kind: String {
        get { return "PIPES"}
    }

    private let gapSize: CGFloat = 50

    private let pipesNode: SKNode
    private let finalOffset: CGFloat!
    private let startingOffset: CGFloat!

    init(topPipeTexture: String, bottomPipeTexture: String, centerY: CGFloat) {
        pipesNode = SKNode()
        pipesNode.name = PipesNode.kind

        let pipeTop = createPipe(imageNamed: topPipeTexture)
        let pipeTopPosition = CGPoint(x: 0, y: centerY + pipeTop.size.height/2 + gapSize)
        pipeTop.position = pipeTopPosition
        pipesNode.addChild(pipeTop)

        let pipeBottom = createPipe(imageNamed: bottomPipeTexture)
        let pipeBottomPosition = CGPoint(x: 0 , y: centerY - pipeBottom.size.height/2 - gapSize)
        pipeBottom.position = pipeBottomPosition
        pipesNode.addChild(pipeBottom)

        finalOffset = -pipeBottom.size.width
        startingOffset = -finalOffset
    }
}

private func createPipe(imageNamed : String ) -> SKSpriteNode {
    let pipeNode = SKSpriteNode(imageNamed: imageNamed)
    return pipeNode
}

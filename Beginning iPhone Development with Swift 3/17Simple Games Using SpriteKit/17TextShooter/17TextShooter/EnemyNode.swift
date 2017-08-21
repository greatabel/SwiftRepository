import SpriteKit

class EnemyNode: SKNode {

    override init() {
        super.init()
        name = "Enemy \(self)"
        initNodeGraph()
    }

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

    private func initNodeGraph(){
        let topRow = SKLabelNode(fontNamed: "Courier-Bold")
        topRow.fontColor = SKColor.brown
        topRow.fontSize = 20
        topRow.text = "x x"
        topRow.position = CGPoint(x: 0, y: 15)
        addChild(topRow)
        let middleRow = SKLabelNode(fontNamed: "Courier-Bold")
        middleRow.fontColor = SKColor.brown
        middleRow.fontSize = 20
        middleRow.text = "x"
        addChild(middleRow)
        let bottomRow = SKLabelNode(fontNamed: "Courier-Bold")
        bottomRow.fontColor = SKColor.brown
        bottomRow.fontSize = 20
        bottomRow.text = "x x"
        bottomRow.position = CGPoint(x: 0, y: -15)
        addChild(bottomRow)
    }
}

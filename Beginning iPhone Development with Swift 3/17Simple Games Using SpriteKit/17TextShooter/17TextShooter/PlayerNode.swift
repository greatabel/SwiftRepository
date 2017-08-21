import SpriteKit

class PlayerNode: SKNode {

    override init(){
        super.init()
        name = "Player \(self)"
        initNodeGraph()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func initNodeGraph() {
        let label = SKLabelNode(fontNamed: "Courier")
        label.fontColor = SKColor.darkGray
        label.fontSize = 40
        label.text = "v"
        label.zRotation = CGFloat(Double.pi)
        label.name = "label"
        self.addChild(label)
    }

}

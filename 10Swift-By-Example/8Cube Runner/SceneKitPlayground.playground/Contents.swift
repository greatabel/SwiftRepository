//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit
import SceneKit
import UIKit

class GameScene: SKScene {
    
    private var label : SKLabelNode!
    private var spinnyNode : SKShapeNode!
    
    override func didMove(to view: SKView) {

    }

}

// Load the SKScene from 'GameScene.sks'
let sceneView = SCNView(frame: CGRect(x:0 , y:0, width: 400, height: 480))
var scene = SCNScene()
sceneView.scene = scene

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

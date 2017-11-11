//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit
import SceneKit
import UIKit


// Load the SKScene from 'GameScene.sks'
let sceneView = SCNView(frame: CGRect(x:0 , y:0, width: 400, height: 480))
var scene = SCNScene()

var cameraNode = SCNNode()
cameraNode.camera = SCNCamera()
cameraNode.position = SCNVector3(x: 0, y: 0, z: 4)
scene.rootNode.addChildNode(cameraNode)


sceneView.scene = scene

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

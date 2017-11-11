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

var torus = SCNTorus(ringRadius: 1, pipeRadius: 0.35)
var torusNode = SCNNode(geometry: torus)
torusNode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
scene.rootNode.addChildNode(torusNode)

torus.firstMaterial?.diffuse.contents = UIColor.green
torus.firstMaterial?.specular.contents = UIColor.white

torusNode.rotation = SCNVector4(x: 1.0, y: 0.0, z: 0.0, w: Float(Double.pi/4.0))

var light = SCNLight()
light.type = SCNLight.LightType.spot
var lightNode = SCNNode()
lightNode.light = light
lightNode.position = SCNVector3(x: 0, y:0, z:6)
scene.rootNode.addChildNode(lightNode)

sceneView.scene = scene

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

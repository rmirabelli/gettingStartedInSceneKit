import UIKit
import PlaygroundSupport
import SceneKit

let view = SCNView(frame: CGRect(x:0, y:0, width: 400, height: 400))
PlaygroundPage.current.liveView = view

let scene = SCNScene()
view.scene = scene

scene.background.contents = #imageLiteral(resourceName: "hubble_friday_04152016.jpg")


let sphere = SCNSphere(radius: 2.0)
let sphereNode = SCNNode(geometry: sphere)
scene.rootNode.addChildNode(sphereNode)

sphere.materials.first?.diffuse.contents = UIImage(named: "earthmap1k.jpg")
sphere.materials.first?.emission.contents = UIImage(named: "earthlights1k.jpg")
sphere.materials.first?.specular.contents = UIImage(named: "earthspec1k.jpg")
sphere.materials.first?.normal.contents = UIImage(named: "earthbump1k.jpg")

let light = SCNLight()
let lightNode = SCNNode()
lightNode.light = light
scene.rootNode.addChildNode(lightNode)
lightNode.position = SCNVector3(5, 5, -10)

let rotate = SCNAction.rotateBy(x: 0.0, y: 1.0, z: 0.0, duration: 1.0)
let rotateForever = SCNAction.repeatForever(rotate)
sphereNode.runAction(rotateForever)

let moon = SCNSphere(radius: 0.2)
let moonNode = SCNNode(geometry: moon)
moonNode.position = SCNVector3(x: 0, y: 0, z: 2.4)
sphereNode.addChildNode(moonNode)

moon.materials.first?.diffuse.contents = UIImage(named:"moonmap1k.jpg")
moon.materials.first?.normal.contents = UIImage(named: "moonbump1k.jpg")

let invisibleSphere = SCNSphere(radius: 2.0)
let invisibleSphereNode = SCNNode(geometry: invisibleSphere)
invisibleSphere.materials.first?.diffuse.contents = UIColor.clear
scene.rootNode.addChildNode(invisibleSphereNode)
invisibleSphereNode.addChildNode(moonNode)

let rotateInvisible = SCNAction.rotateBy(x: -1, y: 1, z: 0.2, duration: 3)
let repeatRotateInvisible = SCNAction.repeatForever(rotateInvisible)
invisibleSphereNode.runAction(repeatRotateInvisible)



//
//  ViewController.swift
//  ARDiceApp
//
//  Created by Connor Boyce on 11/4/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
//https://www.solarsystemscope.com/textures/ for texture maps
// www.blender.org allows you to use cool 3D models created by other people
// www.turbosquid.com huge catalog of 3D models
// Need .dae files from this website in order to work in our app
// Change it from a .dae to .scn using the editor drop down menu

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var diceArray = [SCNNode]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

        sceneView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor {
            let planeAnchor = anchor as! ARPlaneAnchor
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            let planeNode = SCNNode()
            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            plane.materials.first?.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            planeNode.geometry = plane
            node.addChildNode(planeNode)
        } else {
            return
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)

            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            if let hitResults = results.first{
                 let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
                        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true){
                            diceNode.position = SCNVector3(hitResults.worldTransform.columns.3.x, hitResults.worldTransform.columns.3.y + diceNode.boundingSphere.radius, hitResults.worldTransform.columns.3.z)
                            sceneView.scene = diceScene
                            diceArray.append(diceNode)
                            sceneView.scene.rootNode.addChildNode(diceNode)
                            let randomX = Float(arc4random_uniform(4) + 1) * (Float.pi/2)
                            let randomZ = Float(arc4random_uniform(4) + 1) * (Float.pi/2)
                            diceNode.runAction(SCNAction.rotateBy(x: CGFloat(randomX*5), y: 0, z: CGFloat(randomZ*5), duration: 0.5))
                        }

            }
        }
    }
}

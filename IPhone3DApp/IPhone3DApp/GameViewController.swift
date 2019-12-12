//
//  GameViewController.swift
//  IPhone3DApp
//
//  Created by Connor Boyce on 10/23/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit


class GameViewController: UIViewController, SCNSceneRendererDelegate {

    var gameView: SCNView!
    var gameScene: SCNScene!
    var cameraNode: SCNNode!
    var targetCreationTime: TimeInterval = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initScene()
        initCamera()
        

    }
    func initView(){

        gameView = self.view as? SCNView
        gameView.allowsCameraControl = true
        gameView.autoenablesDefaultLighting = true
        gameView.delegate = self

    }

    func initScene(){
        gameScene = SCNScene()
        gameView.scene = gameScene
        gameView.isPlaying = true


    }

    func initCamera(){
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()

        cameraNode.position = SCNVector3(0, 0, 30)
        gameScene.rootNode.addChildNode(cameraNode)
    }

    func createTarget(location: CGPoint){

        let geometry:SCNGeometry = SCNPyramid(width: 2, height: 2, length: 2)
        let randomColor = arc4random_uniform(2) == 0 ? UIColor.green : UIColor.red
        geometry.materials.first?.diffuse.contents = randomColor

        let pyramidNode = SCNNode(geometry: geometry)
        pyramidNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)

        if randomColor == UIColor.red{
            pyramidNode.name = "Bad"
        } else {
            pyramidNode.name = "Good"
        }

        pyramidNode.position = SCNVector3(0,0,0)
        print(pyramidNode.position)
        gameScene.rootNode.addChildNode(pyramidNode)

//        let force = SCNVector3(Float.random(in: -1...1), Float.random(in: 15...20), 0)
//
//        pyramidNode.physicsBody?.applyForce(force, at: SCNVector3(x: 0.05, y: 0.05, z: 0.05), asImpulse: true)

    }

//    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
//        if time > targetCreationTime{
////            createTarget()
//            targetCreationTime = time + 0.6
//        }
//        cleanUp()
//    }

//    func cleanUp(){
//        for node in gameScene.rootNode.childNodes{
//            if node.presentation.position.y < -2 {
//                node.removeFromParentNode()
//            }
//        }
//    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameView.backgroundColor = UIColor.red
        let touch = touches.first!

        let location = touch.location(in: gameView)


//        print(location)
//        createTarget(location: location)
//        let bullet: SCNGeometry = SCNSphere(radius: 0.25)
//        bullet.materials.first?.diffuse.contents = UIColor.black
//        let bulletNode = SCNNode(geometry: bullet)
////        bulletNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
//        bulletNode.position = SCNVector3(CGFloat(location.x), CGFloat(location.y), 0)
//        gameScene.rootNode.addChildNode(bulletNode)
//        let newForce = SCNVector3(0, 0, 10)
//        bulletNode.physicsBody?.applyForce(newForce, at: SCNVector3(x: 0.05, y: 0.05, z: 0.05), asImpulse: true)


        let hitList = gameView.hitTest(location, options: nil)
        print(hitList)

        if let hitObject = hitList.first{
//            let node = hitObject.node
            print(hitObject.localCoordinates)
//            if node.name == "Good"{
//                node.removeFromParentNode()
//                gameView.backgroundColor = UIColor.green
//            } else {
//                node.removeFromParentNode()
//                gameView.backgroundColor = UIColor.red
//            }
        }
    }


    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

}

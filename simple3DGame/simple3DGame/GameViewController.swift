//
//  GameViewController.swift
//  simple3DGame
//
//  Created by Connor Boyce on 10/23/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//
import SceneKit
import QuartzCore

class GameViewController: NSViewController {

    var gameView: SCNView!
    var gameScene: SCNScene!
    var cameraNode: SCNNode!
    var targetCreationTime: TimeInterval = 0
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func initView(){
        gameView = self.view as? SCNView
        gameView.allowsCameraControl = true
        gameView.autoenablesDefaultLighting = true

    }

    func initScene(){
        gameScene = SCNScene()
        gameView.scene = gameScene

        gameView.isPlaying = true

    }

    func initCamera(){
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()

        cameraNode.position = SCNVector3(0, 5, 10)
    }

}

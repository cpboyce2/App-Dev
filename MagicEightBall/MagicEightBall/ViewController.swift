//
//  ViewController.swift
//  MagicEightBall
//
//  Created by Connor Boyce on 7/24/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballImageArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var ballImageIndex : Int = 0
    
    @IBOutlet weak var ballImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        changeBallImage()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changeBallImage()
        
    }
    
    func changeBallImage(){
        ballImageIndex = Int.random(in: 0...4)
        ballImageView.image = UIImage(named: ballImageArray[ballImageIndex])
        print(ballImageArray[ballImageIndex])
    }
}


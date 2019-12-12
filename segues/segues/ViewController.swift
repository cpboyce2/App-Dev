//
//  ViewController.swift
//  segues
//
//  Created by Connor Boyce on 8/12/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanRecieve {

    @IBAction func changeColor(_ sender: Any) {
        
        view.backgroundColor = UIColor.blue
    }
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForwards"{
            
            let secondVC = segue.destination as! SecondViewController
            secondVC.data = textField.text!
            secondVC.delegate = self
        }
    }
    
    func dataRecieved(data: String) {
        label.text = data
    }

}


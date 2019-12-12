//
//  SecondViewController.swift
//  segues
//
//  Created by Connor Boyce on 8/12/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import UIKit

protocol CanRecieve {
    func dataRecieved(data: String)
}

class SecondViewController: UIViewController {
    
    var delegate : CanRecieve?
    var data : String = ""
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = data

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        delegate?.dataRecieved(data: textField.text!)
        dismiss(animated: true, completion: nil)
    }
    
  

}

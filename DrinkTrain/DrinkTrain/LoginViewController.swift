//
//  LoginViewController.swift
//  DrinkTrain
//
//  Created by Connor Boyce on 9/11/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>) { (<#AuthDataResult?#>, <#Error?#>) in
            <#code#>
        }
    }


}

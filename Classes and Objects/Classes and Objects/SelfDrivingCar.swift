//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Connor Boyce on 8/9/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    
    var destination : String?
    
    func batterySize(){
        print("The battery is huge")
    }
    
    override func drive() {
        super.drive()
        // Below is an example of optional binding
        if let userSetDestination = destination {
            print("towards my home in" + userSetDestination)
        }
    }
}

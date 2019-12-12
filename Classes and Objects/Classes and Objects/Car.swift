//
//  Car.swift
//  Classes and Objects
//
//  Created by Connor Boyce on 8/9/19.
//  Copyright © 2019 Connor Boyce. All rights reserved.
//

import Foundation

enum carType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    
    
    var color = "Black"
    var numberOfSeats = 5
    var typeOfCar = carType.Coupe
    // var typeOfCar : carType = .coupe
    
    init(){

    }
    
    convenience init(chosenColor : String){
        self.init()
        color = chosenColor
    }
    
    func drive(){
        print("Car is moving")
    }
}

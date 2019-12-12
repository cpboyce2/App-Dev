import UIKit

class Car {
    var color = "Red"
    static let singleton = Car()
}

let myCar = Car.singleton
myCar.color = "Blue"

let yourCar = Car.singleton
print(yourCar.color)

let yourCar2 = Car()
print(yourCar2.color)

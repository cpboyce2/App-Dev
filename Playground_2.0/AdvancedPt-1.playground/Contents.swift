import Foundation

let pizzaInInches : Int = 10
var numberOfSlices : Int {
    // This is called a getter because you are trying to get the numberOfSlices for this specific pizza
    get {
    return pizzaInInches - 4
    } set {
        print("Number of slices now has a new value which is \(newValue)")
    }
}
print(numberOfSlices)
 


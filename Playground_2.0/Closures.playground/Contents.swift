import UIKit
// The below lines are an example of passing functions into other functions
//func calculator(n1 : Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
//    return operation(n1, n2)
//}
//
//func add(no1: Int, no2: Int) -> Int {
//    return no1 + no2
//}
//
//func multiply(no1: Int, no2: Int) -> Int{
//    return no1 * no2
//}
//calculator(n1: 2, n2: 5, operation: multiply)

//// Function
//func sum(firstNumber : Int, secondNumber: Int) -> Int {
//    return firstNumber + secondNumber
//}
//
//// Closure
//{ (firstNumber: Int, secondNumber: Int) -> Int in
//    return firstNumber + secondNumber
//}

func calculator(n1 : Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

//func add(no1: Int, no2: Int) -> Int {
//    return no1 + no2
//}
// calculator(n1: 2, n2: 5, operation: { (no1, no2) in no1 * no2})

let result = calculator(n1: 2, n2: 3) {$0 * $1}

let array = [6,2,3,9,4,1]


//array.map({(n1 : Int) -> Int in
//    return n1 + 1
//})

let newArray = print(array.map{"\($0 + 1)"})

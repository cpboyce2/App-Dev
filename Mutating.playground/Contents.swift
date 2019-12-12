import UIKit

func greet(name: String, withGreeting greeting: String) -> String {
    return "\(greeting), \(name)"
}

//func greeting(forName name: String) -> (String) -> String {
//    func greeting(_ greeting: String) -> String {
//    return "\(greeting), \(name)"
//    }
//    return greeting
//}
//
//let myGreeting = greeting(forName: "Connor")
//let myActualGreeting = myGreeting("Hello, ")

func greeting(_ greeting: String) -> (String) -> String {
    return {
        (name: String) -> String in return "\(greeting), \(name)"
    }
}

let myGreeting = greeting("Hello")
let myActualGreeting = myGreeting("Connor")
print(myActualGreeting)

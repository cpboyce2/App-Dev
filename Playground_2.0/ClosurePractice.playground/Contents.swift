import UIKit

let volunteerCounts = [10,54,71,66,43,38,20,57,65]

func sortAscending(_ i : Int, _ j : Int) -> Bool{
    return i < j
    
}

let newCounts = volunteerCounts.sorted(by: sortAscending(_:_:))
print(newCounts)

let newnewCounts = volunteerCounts.sorted(by: {(i:Int, j:Int) -> Bool in return i < j})
print(newnewCounts)

let newnewnewCounts = volunteerCounts.sorted(by: {i, j in i < j})
print(newnewnewCounts)

let sortedArray = volunteerCounts.sorted(by: {$0 < $1})
print(sortedArray)

let newSortedArray = volunteerCounts.sorted {$0 < $1}
print(newSortedArray)

func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(byAddingLights lights :Int, toExistingLights existingLights : Int) -> Int{
        return lights + existingLights
    }
    return buildRoads
}

var stopLights = 4
let townPlanByAddingLightsToExistingLights = makeTownGrand()
stopLights = townPlanByAddingLightsToExistingLights(4, stopLights)
print("There are \(stopLights) stoplights")


func filterGreaterThanValue(value: Int, numbers: [Int]) -> [Int]{
    var filteredSetOfNumbers = [Int]()
    for num in numbers{
        if num > value{
           filteredSetOfNumbers.append(num)
        }
    }
    print(filteredSetOfNumbers)
    return []
    }

filterGreaterThanValue(value: 3, numbers: [1, 2, 3, 4, 5, 6])

func filterWithPredicateClosure(closure: (Int) -> Bool, numbers: [Int]) -> [Int] {
    var filteredNumberArray = [Int]()
    for num in numbers{
        if closure(num){
            filteredNumberArray.append(num)
        }
    }
    return filteredNumberArray
}

//print(filterWithPredicateClosure(closure: { (num) -> Bool in
//    return num < 5
//}, numbers: [1, 2, 3, 5, 6]))

func greaterThanThree(value: Int) -> Bool{
    return value > 3
}



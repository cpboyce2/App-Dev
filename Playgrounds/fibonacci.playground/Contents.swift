import Cocoa

func fibonacci(lengthOfSequence : Int) -> Array<Int> {
    var fibArray : [Int] = []
    
    for number in 0..<lengthOfSequence {
        
        if number == 0{
            fibArray.append(0)
            fibArray.append(1)
        }
        
        else{
            fibArray.append(fibArray[number]+fibArray[number-1])
        }
        
        
        }
        
    return fibArray
    }
    
print(fibonacci(lengthOfSequence: 20))

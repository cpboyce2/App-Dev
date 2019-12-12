import Cocoa

func bmiCalculator(height : Float, weight: Float) -> Float {
    
    let bodyMassIndex = weight/(pow(height, 2))
    
    if bodyMassIndex > 0.25{
        print("With a BMI of \(bodyMassIndex) you are overweight")
    }
    
    return bodyMassIndex
}

print(bmiCalculator(height: 1.8, weight: 63))

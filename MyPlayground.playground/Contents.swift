import UIKit

func anagram(str1: String, str2: String) -> Bool {

    str1.lowercased().replacingOccurrences(of: " ", with: "")
    str2.lowercased().replacingOccurrences(of: " ", with: "")
    print(str1.count, str2.count)
    if str1.count != str2.count{
        return false
    }


    let sorted1 = Array(str1).sorted()
    print(sorted1)
    let sorted2 = Array(str2).sorted()
    print(sorted2)

    if sorted1 == sorted2 {
        return true
    }

    return false



}

anagram(str1: "Dormitory", str2: "Dirty room")


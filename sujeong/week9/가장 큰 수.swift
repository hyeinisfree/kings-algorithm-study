import Foundation

func sortedBy(_ s1:String, _ s2:String) -> Bool {
    let s1s2:Int = Int(s1 + s2) ?? 0
    let s2s1:Int = Int(s2 + s1) ?? 0
    
    return s1s2 > s2s1
}

func solution(_ numbers:[Int]) -> String {
    
    let sortedNumbers = numbers.map{ String($0) }.sorted(by: sortedBy)
    
    let result:String = sortedNumbers.reduce("") { $0 + $1 }
    
    if result.first == "0" {
        return "0"
    } else {
        return result
    }
}

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var numOfClothes:[String:Int] = [:]
    
    for c in clothes {
        if numOfClothes[c[1]] == nil {
            numOfClothes[c[1]] = 1
        } else {
            numOfClothes[c[1]]? += 1
        }
    }
    
    return numOfClothes.values.reduce(1) { $0 * ($1+1) } - 1
}

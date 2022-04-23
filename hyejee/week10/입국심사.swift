import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var answer: Int64 = 0
    let sortedTimes: [Int] = times.sorted()
    var lowerBound: Int64 = 0
    var upperBound: Int64 = Int64(n * sortedTimes[0])
    
    while lowerBound <= upperBound {
        let middle: Int64 = (lowerBound + upperBound) / 2
        
        var maxCount: Int64 = 0
        
        for time in sortedTimes {
            maxCount += middle / Int64(time)
        } 
        
        if maxCount < n {
            lowerBound = middle + 1
        }
        else {
            answer = middle
            upperBound = middle - 1
        }
    }
    
    return answer
}

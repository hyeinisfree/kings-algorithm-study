import Foundation

var lionInfo: [Int] = Array(repeating: 0, count: 11)
var maxLionInfo: [Int] = [-1]
var maxScoreGap: Int = Int.min

func chooseAScore(_ index: Int, _ arrowCount: Int, _ target: Int, _ peachInfo: [Int]) {
    if arrowCount == target {
        var lionScore: Int = 0
        var peachScore: Int = 0
        
        for index in 0..<10 {
            if lionInfo[index] > 0 {
                lionScore += (10 - index)
            }
            else if peachInfo[index] > 0{
                peachScore += (10 - index)
            }
        }

        if lionScore > peachScore, lionScore - peachScore > maxScoreGap {
            maxLionInfo = lionInfo
            maxScoreGap = lionScore - peachScore
        }
        else if lionScore > peachScore, lionScore - peachScore == maxScoreGap {
            guard maxLionInfo.count == 11 else {
                return
            }
            
            var hasMoreLowArrows: Bool = true
            
            for index in (stride(from: 10, through: 0, by: -1)) {
                if maxLionInfo[index] > lionInfo[index] {
                    hasMoreLowArrows = false
                    break
                }
            }
            
            if hasMoreLowArrows {
                maxLionInfo = lionInfo
                maxScoreGap = lionScore - peachScore
            }
        }
        
        return
    }
    
    for candidate in index..<10 {
        if arrowCount + peachInfo[candidate] + 1 <= target {
            lionInfo[candidate] = peachInfo[candidate] + 1
            chooseAScore(candidate + 1, arrowCount + peachInfo[candidate] + 1, target, peachInfo)
            lionInfo[candidate] = 0
        }
        else if candidate == 9 {
            lionInfo[10] = target - arrowCount
            chooseAScore(candidate + 1, target, target, peachInfo)
            lionInfo[10] = 0
        }
    }
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    chooseAScore(0, 0, n, info)
    return maxLionInfo
}

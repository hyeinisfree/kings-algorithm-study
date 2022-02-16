import Foundation

func solution1(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {

    let scoreRankMap: [Int:Int] = [0:6, 1:6, 2:5, 3:4, 4:3, 5:2, 6:1]
    var correctCount: Int = 0
    var unclearCount: Int = 0

    lottos.forEach{
        if $0 == 0 { unclearCount += 1 }
        else if win_nums.contains($0) { correctCount += 1 }
    }

    let lowestRank = scoreRankMap[correctCount] ?? 0
    let highestRank = scoreRankMap[correctCount + unclearCount] ?? 0

    return [highestRank, lowestRank]
}

import Foundation

func solution2(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    let scoreRankMap: [Int:Int] = [0:6, 1:6, 2:5, 3:4, 4:3, 5:2, 6:1]
    var correctCount: Int = lottos.filter{ win_nums.contains($0) }.count
    var unclearCount: Int = lottos.filter{ $0 == 0 }.count
    
    let highestRank = scoreRankMap[correctCount + unclearCount] ?? 0
    let lowestRank = scoreRankMap[correctCount] ?? 0

    return [highestRank, lowestRank]
}

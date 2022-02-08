import Foundation

func getScore(_ answers:[Int], _ rAnswers: [Int]) -> Int {
    let size: Int = answers.count
    var i: Int = 0
    var score: Int = 0
    
    for ra in rAnswers {
        if ra == answers[i] {
            score += 1
        }
        i = (i+1) % size
    }
    
    return score
}

func solution(_ answers:[Int]) -> [Int] {
    var result: [Int] = []
    var max: Int
    var scores: [Int] = []
    let students: [[Int]] = [
        [1,2,3,4,5],
        [2,1,2,3,2,4,2,5],
        [3,3,1,1,2,2,4,4,5,5]
    ]
    
    
    for student in students {
        scores.append(getScore(student, answers))
    }
    
    max = scores.max()!
    scores.enumerated().forEach {
        if max == $0.element {
            result.append($0.offset + 1)
        }
    }
    
    return result
}

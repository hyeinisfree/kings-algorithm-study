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

func solution2(_ answers:[Int]) -> [Int] {
    var scores: [Int:Int] = [1:0, 2:0, 3:0]
    let students: [[Int]] = [
        [1,2,3,4,5],
        [2,1,2,3,2,4,2,5],
        [3,3,1,1,2,2,4,4,5,5]
    ]
    
    for (i,v) in answers.enumerated() {
        if students[0][i % 5] == v { scores[1] = scores[1]!+1 }
        if students[1][i % 8] == v { scores[2] = scores[2]!+1 }
        if students[2][i % 10] == v { scores[3] = scores[3]!+1 }
    }
    
    
    return scores.filter{ $0.value == scores.values.max() }.map{ $0.key }.sorted()
}

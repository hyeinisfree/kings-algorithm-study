//
//  main.swift
//  programmers-swift
//
//  Created by HyeJee Kim on 2022/02/11.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var maxStudents: Int = 0
    var numberOfTrainingSets: [Int] = .init(repeating: 1, count: n + 1)
    
    for lostStudent in lost {
        numberOfTrainingSets[lostStudent] -= 1
    }
    
    for reservedStudent in reserve {
        numberOfTrainingSets[reservedStudent] += 1
    }
    
    for student in 1...n {
        switch numberOfTrainingSets[student] {
            case 0:
            continue
            case 1:
            maxStudents += 1
            continue
            case 2:
            maxStudents += 1
            
            let previousStudent: Int = student - 1
            
            if previousStudent >= 1, numberOfTrainingSets[previousStudent] == 0 {
                maxStudents += 1
                numberOfTrainingSets[previousStudent] += 1
                numberOfTrainingSets[student] -= 1
                continue
            }
            
            let nextStudent: Int = student + 1
            
            if nextStudent <= n, numberOfTrainingSets[nextStudent] == 0 {
                numberOfTrainingSets[nextStudent] += 1
                numberOfTrainingSets[student] -= 1
                continue
            }
            
            default:
            return -1
        }
    }
    
    return maxStudents
}

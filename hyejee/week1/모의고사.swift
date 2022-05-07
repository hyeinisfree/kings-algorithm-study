//
//  main.swift
//  kings-algorithm-study
//
//  Created by HyeJee Kim on 2022/02/07.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    guard !answers.isEmpty else {
        return []
    }
    
    let answerSequenceOfNumberOne: [Int] = [1, 2, 3, 4, 5]
    let answerSequenceOfNumberTwo: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
    let answerSequenceOfNumberThree: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]

    var countOfNumberOne: Int = 0
    var countOfNumberTwo: Int = 0
    var countOfNumberThree: Int = 0
    
    for index in 0..<answers.count {
        if answers[index] == answerSequenceOfNumberOne[index % 5] {
            countOfNumberOne += 1
        }
        
        if answers[index] == answerSequenceOfNumberTwo[index % 8] {
            countOfNumberTwo += 1
        }
        
        if answers[index] == answerSequenceOfNumberThree[index % 10] {
            countOfNumberThree += 1
        }
    }
    
    let result: [Int: Int] = [1: countOfNumberOne, 2: countOfNumberTwo, 3: countOfNumberThree]
    
    guard let maxValue: (key: Int, value: Int) = result.max(by: { $0.value < $1.value }) else {
        return []
    }
    
    return result.compactMap({
        if $0.value == maxValue.value {
            return $0.key
        }
        else {
            return nil
        }
    }).sorted()
}

//
//  main.swift
//  programmers-swift
//
//  Created by HyeJee Kim on 2022/02/11.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    guard !commands.isEmpty else {
        return []
    }
    
    var resultArr: [Int] = []
    
    for command in commands {
        guard command.count == 3 else {
            return []
        }
        
        let startIndex: Int = command[0] - 1
        let endIndex: Int = command[1] - 1
        var slicedArr: [Int] = Array(array[startIndex...endIndex])
        slicedArr.sort()
        print(slicedArr)
        
        resultArr.append(slicedArr[command[2] - 1])
    }
    
    return resultArr
}


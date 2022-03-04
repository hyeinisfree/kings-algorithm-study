//
//  main.swift
//  programmers-swift
//
//  Created by HyeJee Kim on 2022/02/11.
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let sorted: [Int] = d.sorted()
    
    var count: Int = 0
    var sum: Int = 0
    
    for requested in sorted {
        sum += requested
        
        if sum > budget {
            return count
        }
        else {
            count += 1
        }
    }
    
    return count
}

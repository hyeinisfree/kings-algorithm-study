//
//  main.swift
//  programmers-swift
//
//  Created by HyeJee Kim on 2022/02/11.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    guard sizes.count > 0 else {
        return 0
    }
    
    var minWidth: Int = -1
    var minHeight: Int = -1
    
    sizes.forEach {
        let smaller: Int
        let bigger: Int
        
        if $0[0] > $0[1] {
            smaller = $0[1]
            bigger = $0[0]
        }
        else {
            smaller = $0[0]
            bigger = $0[1]
        }
        
        if smaller > minWidth {
            minWidth = smaller
        }
        
        if bigger > minHeight {
            minHeight = bigger
        }
    }
    
    return minWidth * minHeight
}

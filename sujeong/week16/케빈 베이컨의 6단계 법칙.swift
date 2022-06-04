//
//  lyrics.swift
//  kings-algorithm-project
//
//  Created by 임수정 on 2022/03/25.
//

import Foundation

let INF:Int = 5000
let inputNM:[String] = (readLine()?.components(separatedBy: " "))!

let N:Int = Int(inputNM[0])!
let M:Int = Int(inputNM[1])!

var adj:[[Int]] = Array(repeating: Array(repeating: INF, count: N+1), count: N+1)

for i in 0...N {
    for j in 0...N {
        if i == j || i == 0 || j == 0 {
            adj[i][j] = 0
        } else {
            adj[i][j] = INF
        }
    }
}

for _ in 1...M {
    let ab:[String] = (readLine()?.components(separatedBy: " "))!
    let a:Int = Int(ab[0])!
    let b:Int = Int(ab[1])!
    
    adj[a][b] = 1
    adj[b][a] = 1
}

//floyd

for k in 1...N {
    for i in 1...N {
        for j in 1...N {
            adj[i][j] = min(adj[i][j], adj[i][k] + adj[k][j])
        }
    }
}


var minValue:Int = Int.max
var result:Int = 0

adj.removeFirst()
adj.map{ $0.reduce(0, +) }.enumerated().forEach{
    if minValue > $0.element {
        minValue = $0.element
        result = $0.offset
    }
}

print(result+1)


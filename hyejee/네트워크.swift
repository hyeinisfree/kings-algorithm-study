//
//  main.swift
//  programmers-swift
//
//  Created by HyeeJee Kim on 2022/04/09.
//

import Foundation

func dfs(computer: Int, computers: [[Int]], visited: inout [Bool]) {
    visited[computer] = true
    
    for index in 0..<computers.count {
        if computers[computer][index] == 0 {
            continue
        }
        
        if visited[index] {
            continue
        }
        
        dfs(computer: index, computers: computers, visited: &visited)
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: n)
    var networkCount: Int = 0
    
    // 방문하지 않은 컴퓨터를 시작 노드로 삼아 네트워크 찾기 시작
    for computer in 0..<n {
        if visited[computer] {
            continue
        }
        
        dfs(computer: computer, computers: computers, visited: &visited)
        networkCount += 1
    }
    
    return networkCount
}

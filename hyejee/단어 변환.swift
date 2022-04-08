//
//  단어 변환.swift
//  programmers-swift
//
//  Created by HyeeJee Kim on 2022/04/09.
//

import Foundation

func checkReachability(word1: String, word2: String) -> Bool {
    let characterArray: [Character] = Array(word1)
    
    for characterIndex in 0..<characterArray.count {
        let regex: NSRegularExpression = try! NSRegularExpression(pattern: "^\(String(characterArray[0..<characterIndex])).\(String(characterArray[(characterIndex + 1)...]))$")
        let range: NSRange = NSRange(location: 0, length: word2.count)
        
        if regex.firstMatch(in: word2, range: range) != nil {
            return true
        }
    }
    
    return false
}

func bfs(start: String, adjacentList: [String: Set<String>], end: String) -> Int {
    var queue: [String] = []
    var dist: [String: Int] = [:]
    
    queue.append(start)
    dist[start] = 0
    
    while !queue.isEmpty {
        let currentWord: String = queue.removeFirst()
        
        guard let adjacentWords: Set<String> = adjacentList[currentWord] else {
            fatalError("Invalid word")
        }
        
        for adjacentWord in adjacentWords {
            if dist[adjacentWord] != nil {
                continue
            }
            
            queue.append(adjacentWord)
            dist[adjacentWord] = dist[currentWord, default: 0] + 1
        }
    }
    
    return dist[end, default: 0]
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var adjacentList: [String: Set<String>] = [:]
    
    for word in words {
        if checkReachability(word1: begin, word2: word) {
            adjacentList[begin, default: []].insert(word)
            adjacentList[word, default: []].insert(begin)
        }
        
        for wordToCompare in words {
            if wordToCompare == word {
                continue
            }
            
            if checkReachability(word1: word, word2: wordToCompare) {
                adjacentList[word, default: []].insert(wordToCompare)
                adjacentList[wordToCompare, default: []].insert(word)
            }
        }
    }
    
    
    
    return bfs(start: begin, adjacentList: adjacentList, end: target)
}

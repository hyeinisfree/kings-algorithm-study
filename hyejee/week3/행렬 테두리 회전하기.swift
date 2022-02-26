//
//  main.swift
//  Programmers
//
//  Created by HyeJee Kim on 2022/02/25.
//

import Foundation

typealias Location = (row: Int, column: Int)

var directions: [Location] = [
    (0, 1), // 우
    (1, 0), // 하
    (0, -1), // 좌
    (-1, 0) // 상
]

func makeArray(rows: Int, columns: Int) -> [[Int]] {
    var array: [[Int]] = Array(repeating: Array(repeating: 0, count: columns + 1), count: rows + 1)
    var value: Int = 1
    
    for row in 1...rows {
        for column in 1...columns {
            array[row][column] = value
            value += 1
        }
    }
    
    return array
}

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var minValues: [Int] = []
    var array: [[Int]] = makeArray(rows: rows, columns: columns)
    
    for query in queries {
        // 행렬의 테두리를 구한다
        // 행렬의 테두리는 minRow, maxRow, minCol, maxCol 네 지점이다
        let minRow: Int = query[0]
        let minCol: Int = query[1]
        let maxRow: Int = query[2]
        let maxCol: Int = query[3]
        
        var currentLocation: Location = (minRow, minCol)
        var previousValue: Int = array[currentLocation.row][currentLocation.column]
        var currentMinValue: Int = Int.max
        
        var direction: Int = 0
        
        // 우, 하, 좌, 상 순으로 행렬의 테두리를 순회한다
        while direction < 4 {
            let nextLocation: Location = (currentLocation.row + directions[direction].row, currentLocation.column + directions[direction].column)
            
            if nextLocation.row < minRow || nextLocation.row > maxRow || nextLocation.column < minCol || nextLocation.column > maxCol {
                // 방향 전환
                direction += 1
                continue
            }
            
            currentLocation = nextLocation
            
            // 순회하며 값들을 이동 & 최소값을 구한다
            let currentValue: Int = array[currentLocation.row][currentLocation.column]
            array[currentLocation.row][currentLocation.column] = previousValue
            previousValue = currentValue

            currentMinValue = min(currentMinValue, previousValue)
        }
        
        // 순회가 끝나면 최소값을 저장한다
        minValues.append(currentMinValue)
    }
    
    return minValues
}

import Foundation

struct Node: Hashable {
    let row: Int
    let column: Int
    let direction: Int
}

let maxMapSize: Int = 500 + 5

let directions: [(row: Int, column: Int)] = [
    (-1, 0),
    (0, 1),
    (1, 0),
    (0, -1)
]

var visited: [Node: Bool] = [:]

func bfs(start node: Node, map: [[Character]]) -> Int {
    var queue: [Node] = []
    var cycleLength: Int = 0
    
    queue.append(node)
    visited[node] = true
    cycleLength += 1
    
    while !queue.isEmpty {
        let currentNode: Node = queue.removeFirst()
        
        let newDirection: Int
        
        switch map[currentNode.row][currentNode.column] {
        case "S":
            newDirection = currentNode.direction
        case "L":
            newDirection = (currentNode.direction - 1 + 4) % 4
        case "R":
            newDirection = (currentNode.direction + 1) % 4
        default:
            fatalError("Invalid value")
        }
        
        let nextNode: Node = Node(row: (currentNode.row + directions[newDirection].row + map.count) % map.count, column: (currentNode.column + directions[newDirection].column + map[0].count) % map[0].count, direction: newDirection)
        if visited[nextNode, default: false] {
            break
        }
        
        queue.append(nextNode)
        visited[nextNode] = true
        cycleLength += 1
    }
    
    return cycleLength
}

func solution(_ grid:[String]) -> [Int] {
    let map: [[Character]] = grid.map({ Array($0) })
    let numberOfRows: Int = map.count
    let numberOfColumns: Int = map[0].count
    
    var results: [Int] = []
    
    for row in 0..<numberOfRows {
        for column in 0..<numberOfColumns {
            for direction in 0..<directions.count {
                if visited[Node(row: row, column: column, direction: direction), default: false] {
                    continue
                }
                let cycleLength: Int = bfs(start: Node(row: row, column: column, direction: direction), map: map)
                results.append(cycleLength)
            }
        }
    }
    
    
    return results.sorted()
}

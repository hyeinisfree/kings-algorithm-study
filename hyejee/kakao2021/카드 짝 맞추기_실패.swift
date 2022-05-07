import Foundation

typealias Location = (row: Int, column: Int)

var cardOrders: [[(Int, Int)]] = []

func bfs(start: Location, end: Location, numberOfRows: Int, numberOfColumns: Int) -> Int {
    let directions: [Location] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    var distance: [[Int]] = Array(repeating: Array(repeating: -1, count: numberOfColumns), count: numberOfRows)
    var queue: [Location] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: numberOfColumns), count: numberOfRows)
    
    queue.append(start)
    distance[start.row][start.column] = 0
    visited[start.row][start.column] = true
    
    while !queue.isEmpty {
        let current: Location = queue.removeFirst()

        for direction in directions {
            let adjacent: Location = (current.row + direction.row, current.column + direction.column)
            
            // board를 벗어난 경우
            if adjacent.row < 0 || adjacent.row >= numberOfRows || adjacent.column < 0 || adjacent.column >= numberOfColumns {
                continue
            }
            
            // 이미 방문한 경우
            if visited[adjacent.row][adjacent.column] {
                continue
            }
            
            queue.append(adjacent)
            distance[adjacent.row][adjacent.column] = distance[current.row][current.column] + 1
            visited[adjacent.row][adjacent.column] = true
        }
        
        // ctrl + 왼쪽
        if !visited[current.row][0] {
            queue.append((current.row, 0))
            distance[current.row][0] = distance[current.row][current.column] + 1
            visited[current.row][0] = true
        }
        
        // ctrl + 오른쪽
        if !visited[current.row][numberOfColumns - 1] {
            queue.append((current.row, numberOfColumns - 1))
            distance[current.row][numberOfColumns - 1] = distance[current.row][current.column] + 1
            visited[current.row][numberOfColumns - 1] = true
        }
        
        // ctrl + 위쪽
        if !visited[0][current.column] {
            queue.append((0, current.column))
            distance[0][current.column] = distance[current.row][current.column] + 1
            visited[0][current.column] = true
        }
        
        // ctrl + 아래쪽
        if !visited[numberOfRows - 1][current.column] {
            queue.append((numberOfRows - 1, current.column))
            distance[numberOfRows - 1][current.column] = distance[current.row][current.column] + 1
            visited[numberOfRows - 1][current.column] = true
        }
    }
    
    return distance[end.row][end.column]
}

func chooseACard(cards: [Int], isUsed: [Int: Bool], picked: [(Int, Int)], target: Int) {
    if picked.count == target * 2 {
        cardOrders.append(picked)
    }
    
    for card in cards {
        if isUsed[card, default: false] {
            continue
        }
        
        var _isUsed = isUsed
        _isUsed[card] = true
        chooseACard(cards: cards, isUsed: _isUsed, picked: picked + [(card, 0), (card, 1)], target: target)
        chooseACard(cards: cards, isUsed: _isUsed, picked: picked + [(card, 1), (card, 0)], target: target)
    }
}

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    let boardSize: Int = board.count
    
    var cardLocation: [Int: [Location]] = [:]
    
    // 카드 종류와 카드 쌍의 위치를 파악한다
    for row in 0..<boardSize {
        for column in 0..<boardSize {
            if board[row][column] == 0 {
                continue
            }

            let card: Int = board[row][column]
            cardLocation[card, default: []].append((row, column))
        }
    }
    
    // 찾을 카드 순서를 결정한다
    chooseACard(cards: Array(cardLocation.keys), isUsed: [:], picked: [], target: cardLocation.keys.count)
    
    var minOperationCount: Int = Int.max
    
    for cardOrder in cardOrders {
        var operationCount = 0
        
        var currentLocation: Location = (r, c)
        
        for card in cardOrder {
            guard let locationsOfTheCard: [Location] = cardLocation[card.0] else {
                fatalError()
            }
            
            operationCount += bfs(start: currentLocation, end: locationsOfTheCard[card.1], numberOfRows: boardSize, numberOfColumns: boardSize)
            currentLocation = locationsOfTheCard[card.1]
        }
        
        minOperationCount = min(minOperationCount, operationCount + cardLocation.keys.count * 2)
    }
    
    return minOperationCount
}

import Foundation

let moves: [(a: Int, b: Int)] = [(1, -1), (1, 1), (2, 0)] // 수빈이의 위치 x인 경우 수빈이가 갈 수 있는 위치는 (a * x + b)임.

func bfs(start: Int, target: Int) -> Int {
    var dist: [Int] = Array(repeating: -1, count: 1000_001)
    var queue: [Int] = []
    
    queue.append(start)
    dist[start] = 0
    
    while dist[target] == -1 {
        let current: Int = queue.removeFirst()
        
        for move in moves {
            let next: Int = move.a * current + move.b
            
            // next가 bounds를 벗어난 경우
            if next < 0 || next > 1000_000 { continue }
            // dist[next]가 이미 구해진 경우
            if dist[next] != -1 { continue }
            
            dist[next] = dist[current] + 1
            queue.append(next)
        }
    }
    
    return dist[target]
}

var startLocation: Int = 0
var targetLocation: Int = 0

if let temp: [Int] = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }) {
    if temp.count == 2 {
        startLocation = temp[0]
        targetLocation = temp[1]
    }
    else {
        exit(1)
    }
}

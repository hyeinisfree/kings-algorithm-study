let maxNumberOfNodes: Int = 1_001
var visited: [Bool] = Array(repeating: false, count: maxNumberOfNodes)

/// 그래프 전체 노드의 개수를 저장할 변수
var numberOfNodes: Int = -1
/// 그래프 전체 간선의 개수를 저장할 변수
var numberOfEdges: Int = -1
/// 그래프 탐색을 시작할 노드의 번호를 저장할 변수
var startNode: Int = -1
/// 그래프를 인접행렬의 형태로 저장할 변수
var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: maxNumberOfNodes), count: maxNumberOfNodes)

var dfsOutput: String = ""
var bfsOutput: String = ""

func getInput() {
    if let tempArr: [Int] = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }) {
        numberOfNodes = tempArr[0]
        numberOfEdges = tempArr[1]
        startNode = tempArr[2]
    }
    
    for _ in 0..<numberOfEdges {
        if let tempArr: [Int] = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }) {
            graph[tempArr[0]][tempArr[1]] = true
            graph[tempArr[1]][tempArr[0]] = true
        }
    }
}

func resetVisited() {
    visited = Array(repeating: false, count: maxNumberOfNodes)
}

/// 방문할 수 있는 노드 node를 인자로 받아
/// node에서 방문할 수 있는 node들로
/// dfs를 수행하는 함수
func dfs(node: Int) {
    // node를 방문했다는 표시 남기기
    visited[node] = true
    // dfsOutput에 추가하기
    dfsOutput += "\(node) "
    
    // node에서 방문할 수 있고, 아직 방문되지 않은 모든 노드들에 대해 dfs(node:) 수행
    for adjacentNode in 1...numberOfNodes where graph[node][adjacentNode] {
        // 이미 방문한 adjacentNode는 다시 방문할 필요 없음
        if visited[adjacentNode] {
            continue
        }
        else {
            // adjacentNode를 방문한다
            dfs(node: adjacentNode)
        }
    }
}

func bfs(start node: Int) {
    var queue: [Int] = []
    
    queue.append(node)
    visited[node] = true
    bfsOutput += "\(node) "
    
    while !queue.isEmpty {
        let currentNode: Int = queue.removeFirst()
        
        for adjacentNode in 1...numberOfNodes where graph[currentNode][adjacentNode] {
            if visited[adjacentNode] {
                continue
            }
            else {
                queue.append(adjacentNode)
                visited[adjacentNode] = true
                bfsOutput += "\(adjacentNode) "
            }
        }
    }
}

func solution() {
    getInput()
    dfs(node: startNode)
    resetVisited()
    bfs(start: startNode)
    
    print("\(dfsOutput)\n\(bfsOutput)")
}

solution()
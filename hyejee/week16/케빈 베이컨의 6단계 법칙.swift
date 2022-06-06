import Foundation

var graph: [Int: [Int]] = [:]
var numberOfUsers: Int = 0

func getInput() {
    var numberOfRelations: Int = 0
    if let tempArr: [Int] = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }) {
        guard tempArr.count == 2 else {
            fatalError()
        }
        
        numberOfUsers = tempArr[0]
        numberOfRelations = tempArr[1]
    }
    
    for _ in 0..<numberOfRelations {
        if let tempArr: [Int] = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }) {
            guard tempArr.count == 2 else {
                fatalError()
            }
            
            graph[tempArr[0], default: []].append(tempArr[1])
            graph[tempArr[1], default: []].append(tempArr[0])
        }
    }
}

func calculateKevinBacon(of user: Int) -> Int {
    var distance: [Int] = Array(repeating: -1, count: numberOfUsers + 1)
    var queue: [Int] = []
    
    queue.append(user)
    distance[user] = 0
    
    while !queue.isEmpty {
        let currentUser: Int = queue.removeFirst()
        
        if let friends: [Int] = graph[currentUser] {
            for friend in friends {
                if distance[friend] != -1 { continue }
                
                distance[friend] = distance[currentUser] + 1
                queue.append(friend)
            }
        }
    }
    
    return distance.reduce(into: 0, { $0 += $1 })
}

func solution() {
    // 인접 행렬 형태로 그래프 생성하기
    getInput()
    
    // 모든 사람들에 대해서 케빈 베이컨 수를 구한다
    // 구해진 케빈 베이컨 수가 현재 최소보다 작은지 확인한다
    var minUser: Int = -1
    var minKevinBaconNumber: Int = Int.max
    
    for user in 1...numberOfUsers {
        let kevinBaconNumber: Int = calculateKevinBacon(of: user)
        
        if kevinBaconNumber < minKevinBaconNumber {
            minUser = user
            minKevinBaconNumber = kevinBaconNumber
        }
    }
    
    print(minUser)
}

solution()
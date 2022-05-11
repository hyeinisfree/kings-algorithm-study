import Foundation

var adj:[[Int]] = [[Int]]()
let MAX_FARE:Int = 20100000

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    
    initAdjMatrix(n, fares)
    
    floyd(n)
        
    let result = getMinFare(n,s,a,b)
    
    return result
}

func initAdjMatrix(_ n:Int, _ fares:[[Int]]) {
    adj = Array(repeating:Array(repeating:MAX_FARE, count:n+1), count:n+1)
    for i in 1...n {
        adj[i][i] = 0
    }
    for edge in fares {
        let nodeS = edge[0]
        let nodeE = edge[1]
        let fare = edge[2]
        adj[nodeS][nodeE] = fare
        adj[nodeE][nodeS] = fare
    }
}

func floyd(_ n:Int){
    for i in 1...n {
        for r in 1...n {
            for c in 1...n {
                adj[r][c] = min(adj[r][c], adj[r][i] + adj[i][c])
            }
        }
    }
}

func getMinFare(_ n:Int, _ s:Int, _ a:Int, _ b:Int) -> Int{
    var minFare:Int = MAX_FARE
    for m in 1...n {
        minFare = min(minFare, adj[s][m] + adj[m][a] + adj[m][b])
    }
    return minFare
}

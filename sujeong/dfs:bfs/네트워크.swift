import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visits = Array(repeating: false, count: n)
    var numOfNetwork:Int = 0
    
    func dfs(_ com:Int) {
        visits[com] = true
        for i in 0..<n {
            if computers[com][i] == 1 && !visits[i] {
                dfs(i)
            }
        }
    }
    
    for i in 0..<n {
        if !visits[i] {
            numOfNetwork += 1
            dfs(i)
        }
    }
    
    return numOfNetwork
}


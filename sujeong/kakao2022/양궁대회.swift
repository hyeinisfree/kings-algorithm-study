import Foundation

var resultCandis:[[Int]] = []
func getResult() {
    for i in stride(from: 10, to: 0, by: -1) {
        if resultCandis.count == 1 { return }
        let max:Int = resultCandis.map{ $0[i] }.max() ?? 0
        resultCandis = resultCandis.filter{ $0[i] == max }
    }
}

var maxGap:Int = 0
var infoA:[Int] = []
func dfs(_ i:Int, _ n:Int, _ rArr:[Int], _ rScore:Int, _ aScore:Int) {
    if i == 10 {
        let gap = rScore - aScore
        if gap > 0 {
            if gap > maxGap {
                maxGap = gap
                resultCandis = [rArr+[n]]
            } else if gap == maxGap {
                resultCandis.append(rArr+[n])
            }
        }
        return
    }
    
    let winNum:Int = infoA[i]+1
    if n >= winNum {
        dfs(i+1, n-winNum, rArr+[winNum], rScore + 10 - i, aScore)
    }
    
    let aPoint:Int = infoA[i] == 0 ? 0 : 10 - i
    dfs(i+1, n, rArr+[0], rScore, aScore + aPoint)
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    infoA = info
    dfs(0, n, [], 0, 0)
    if resultCandis.isEmpty {
        return [-1]
    }
    getResult()
    return resultCandis[0]
}

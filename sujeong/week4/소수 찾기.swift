import Foundation

var numberArray:[Int] = []
var n:Int = 0
var resultSet:Set<Int> = []
var visit:[Bool] = Array(repeating: false, count: 7)

func isPrime(_ num:Int) -> Bool {
    if num < 2 {
        return false
    }
    for d in 2..<num {
        if num % d == 0 {
            return false
        }
    }
    return true
}

func dfs(_ result:Int, _ cnt:Int, _ len:Int){
    if cnt == len {
        if isPrime(result) {
            resultSet.insert(result)
        }
    } else {
        for j in 0..<n {
            if !visit[j] {
                visit[j] = true
                dfs(result*10 + numberArray[j], cnt+1, len)
                visit[j] = false
            }
        }
    }
}

func solution(_ numbers:String) -> Int {
    numberArray = Array(numbers).map { $0.wholeNumberValue ?? 0 }
    n = numberArray.count
    
    for len in 1...n {
        for start in 0..<n {
            visit[start] = true
            dfs(numberArray[start], 1, len)
            visit[start] = false
        }
    }

    return resultSet.count
}

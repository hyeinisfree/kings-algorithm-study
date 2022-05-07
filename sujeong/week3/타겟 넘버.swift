import Foundation

var count: Int = 0

func dfs(_ numbers: [Int], _ target: Int, _ sum: Int, _ i: Int){
    if i == numbers.count - 1 {
        if sum == target {
            count += 1
        }
        return
    }
    
    dfs(numbers, target, sum + numbers[i+1], i+1);
    dfs(numbers, target, sum - numbers[i+1], i+1);
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    dfs(numbers, target, numbers[0], 0)
    dfs(numbers, target, -numbers[0], 0)
    
    return count
}

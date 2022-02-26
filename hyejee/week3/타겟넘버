import Foundation

var count: Int = 0

func dfs(_ numbers: [Int], _ index: Int, _ currentTotal: Int, _ target: Int) {
    if index == numbers.count {
        if currentTotal == target {
            count += 1
        }
        return
    }

    dfs(numbers, index + 1, currentTotal + numbers[index], target)
    dfs(numbers, index + 1, currentTotal - numbers[index], target)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    dfs(numbers, 0, 0, target)
    return count
}

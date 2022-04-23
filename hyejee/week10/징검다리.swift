import Foundation

func solution(_ distance: Int, _ rocks: [Int], _ n: Int) -> Int {
    let sorted = (rocks + [0, distance]).sorted()
    var result: Int = 0
    var left: Int = 1
    var right: Int = distance

    while left <= right {
        let mid = (left + right) / 2
        var remove: Int = 0
        var lastIndex: Int = 0

        (1..<sorted.count).forEach {
            if (sorted[$0] - sorted[lastIndex]) < mid {
                remove += 1
            } else {
                lastIndex = $0
            }
        }

        if remove > n {
            right = mid - 1
        } 
        else {
            left = mid + 1
            result = result < mid ? mid : result
        }
    }

    return result
}

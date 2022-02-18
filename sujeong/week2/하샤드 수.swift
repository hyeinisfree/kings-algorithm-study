import Foundation

func solution1(_ x:Int) -> Bool {
    let sum = Array(String(x)).reduce(0) { $0 + ($1.wholeNumberValue ?? 0) }
    return x % sum == 0
}

func solution2(_ x:Int) -> Bool {
    var varX: Int = x
    var sum: Int = 0

    while varX > 0 {
        sum += varX % 10
        varX /= 10
    }

    return x % sum == 0
}

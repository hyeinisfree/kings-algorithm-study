import Foundation

func isPrime(_ num: Int) -> Bool {
    for d in 2..<num {
        if num % d == 0 { return false }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var answer = 0

    for i in 0...nums.count - 3 {
        for ii in i+1...nums.count - 2 {
            for iii in ii+1...nums.count - 1 {
                let sum: Int = nums[i] + nums[ii] + nums[iii]
                if isPrime(sum) { answer += 1 }
            }
        }
    }

    return answer

}

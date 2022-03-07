import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var answer = ""

    var _k:Int = k
    let numbers:[Character] = Array(number)
    let n:Int = numbers.count
    var stack:[Character] = []
    
    for (i,num) in numbers.enumerated() {
        while _k > 0
                && !stack.isEmpty
                && stack.last!.wholeNumberValue! < num.wholeNumberValue! {
            stack.removeLast()
            _k -= 1
        }
        if stack.count < n-k {
            stack.append(num)
        }
    }
    return String(stack)
}

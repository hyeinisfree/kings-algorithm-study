import Foundation

func solution(_ s:String) -> Int {
    let bracketMap:[Character:Character] = [")":"(", "}":"{", "]":"["]
    
    let sArray:[Character] = Array(s)
    let n:Int = sArray.count
    var result:Int = 0
    
    for start in 0..<n {
        var isRightStr:Bool = true
        var stack:[Character] = []
        var index:Int = start
        repeat {
            let currentChar:Character = sArray[index]
            if currentChar == "(" || currentChar == "{" || currentChar == "[" {
                stack.append(currentChar)
            } else if stack.isEmpty || stack.removeLast() != bracketMap[currentChar] {
                    isRightStr = false
                    break
            }
            index = (index+1) % n
        } while index != start
        
        if isRightStr && stack.isEmpty {
            result += 1
        }
    }
    return result
}

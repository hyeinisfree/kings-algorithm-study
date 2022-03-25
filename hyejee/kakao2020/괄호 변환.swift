import Foundation

func checkValidity(_ string: String) -> Bool {
    guard string.count > 0 else {
        return true
    }
    
    var stack: [Character] = []
    let characterArr: [Character] = Array(string)
    
    for character in characterArr {
        if character ==  "(" {
            stack.append(character)
        }
        else if character == ")" {
            if stack.isEmpty {
                return false
            }
            
            let last: Character = stack.removeLast()
            
            if last == ")" {
                return false
            }
        }
    }
    
    return true
}

func reverseParentheses(_ string: String) -> String {
    guard string.count > 1 else {
        return string
    }
    
    let characterArr: [Character] = Array(string)
    var reversed: String = ""
    
    for character in characterArr {
        if character == "(" {
            reversed += ")"
        }
        else if character == ")" {
            reversed += "("
        }
    }
    
    return reversed
}

func balanceParentheses(_ string: String) -> String {
    if string.isEmpty || checkValidity(string) {
        return string
    }
    
    let characterArr: [Character] = Array(string)
    var leftCount: Int = 0
    var rightCount: Int = 0
    var endIndex: String.Index = string.startIndex
    
    for (index, character) in characterArr.enumerated() {
        if character == "(" {
            leftCount += 1
        }
        else if character == ")" {
            rightCount += 1
        }
        
        if leftCount == rightCount {
            endIndex = string.index(string.startIndex, offsetBy: index)
            break
        }
    }
    
    var u: String = String(string[...endIndex])
    let startIndexOfV: String.Index = string.index(endIndex, offsetBy: 1, limitedBy: string.endIndex) ?? string.endIndex
    var v: String = String(string[startIndexOfV...])
    
    if checkValidity(u) {
        v = balanceParentheses(v)
    }
    else {
        var temp: String = "(" + balanceParentheses(v) + ")"
        u.remove(at: u.startIndex)
        u.remove(at: u.index(u.startIndex, offsetBy: u.count - 1))
        temp += reverseParentheses(u)
        
        return temp
    }
    
    return u + v
}

func solution(_ p:String) -> String {
    return balanceParentheses(p)
}

import Foundation

func validateString(_ string: String) -> Bool {
    let characters: [Character] = Array(string)
    var stack: [Character] = []
    
    for character in characters {
        switch character {
            case "(", "{", "[":
            stack.append(character)
            case ")":
            if stack.isEmpty {
                return false
            }
            
            let top: Character = stack.removeLast()
            if top != "(" {
                return false
            }
            case "}":
            if stack.isEmpty {
                return false
            }
            
            let top: Character = stack.removeLast()
            if top != "{" {
                return false
            }
            case "]":
            if stack.isEmpty {
                return false
            }
            
            let top: Character = stack.removeLast()
            if top != "[" {
                return false
            }
            default:
            continue
        }
    }
    
    if !stack.isEmpty {
        return false
    }
    
    return true
}

func solution(_ s:String) -> Int {
    let characters: [Character] = Array(s)
    
    var count: Int = 0
    
    for index in 0..<characters.count {
        let rotatedString: String = String(characters[index...]) + String(characters[..<index])
        
        if validateString(rotatedString) {
            count += 1
        }
    }
    
    return count
}


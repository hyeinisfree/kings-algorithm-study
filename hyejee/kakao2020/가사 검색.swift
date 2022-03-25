import Foundation

func makeRegex(from query: String) -> NSRegularExpression? {
    let characters: [Character] = Array(query)
    
    var fragment: String = ""
    var count: Int = 0
    
    for character in characters {
        if character == "?" {
            count += 1
        }
        else {
            fragment += "\(character)"
        }
    }
    
    let pattern: String
    
    if fragment.isEmpty {
        pattern = ".{\(count)}$"
    }
    else {
        if characters[0] == "?" {
            pattern = "^.{\(count)}" + "(" + fragment + ")$"
        }
        else {
            pattern = "^(" + fragment + ")" + ".{\(count)}$"
        }
    }
    
    do {
        return try NSRegularExpression(pattern: pattern)
    }
    catch {
        return nil
    }
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var answer: [Int] = []
    
    for query in queries {
        if let regex: NSRegularExpression = makeRegex(from: query) {
            var count: Int = 0
            
            for word in words {
                let range: NSRange = NSRange(location: 0, length: word.count)
                
                if regex.firstMatch(in: word, range: range) != nil {
                    count += 1
                }
            }
            
            answer.append(count)
        }
    }
    
    return answer
}

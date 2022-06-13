// 문제 링크: https://www.acmicpc.net/problem/1541

import Foundation

var formula: String = ""

func getInput() {
    if let tempString: String = readLine() {
        formula = tempString
    }
}

func calculateAddingFormula(_ formula: String) -> Int {
    let characters: [Character] = Array(formula)
    
    var result: Int = 0
    var previousString: String = ""
    
    for character in characters {
        if character == "+" {
            if let number: Int = Int(previousString) {
                result += number
            }
            
            previousString = ""
        }
        else {
            previousString += "\(character)"
        }
    }
    
    if let number: Int = Int(previousString) {
        result += number
    }
    
    return result
}

func calculateMinResult(from formula: String) -> Int {
    let splitedFormula: [Substring] = formula.split(separator: "-")
    let subResults: [Int] = splitedFormula.map({ calculateAddingFormula(String($0)) })
    
    if subResults.count <= 1 {
        return subResults[0]
    }
    else {
        return subResults.reduce(into: subResults[0] * 2, { $0 -= $1 })
    }
}

func solution() {
    getInput()
    print(calculateMinResult(from: formula))
}

solution()

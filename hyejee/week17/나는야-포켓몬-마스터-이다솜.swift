// 문제 링크: https://www.acmicpc.net/problem/1620

import Foundation

var numberToName: [Int: String] = [:]
var nameToNumber: [String: Int] = [:]

func solution() {
    guard let tempArray: [Int] = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }), tempArray.count == 2 else {
        fatalError()
    }
    
    let numberOfPocketmons: Int = tempArray[0]
    let numberOfQuestions: Int = tempArray[1]
    
    for index in 1...numberOfPocketmons {
        if let name = readLine() {
            nameToNumber[name] = index
            numberToName[index] = name
        }
    }
    
    var outputString: String = ""
    
    for _ in 0..<numberOfQuestions {
        guard let tempString: String = readLine() else {
            fatalError()
        }
        
        if let number: Int = Int(tempString), let name: String = numberToName[number] {
            outputString += "\(name)\n"
        }
        else if let number: Int = nameToNumber[tempString] {
            outputString += "\(number)\n"
        }
    }
    
    print(outputString, terminator: "")
}

solution()

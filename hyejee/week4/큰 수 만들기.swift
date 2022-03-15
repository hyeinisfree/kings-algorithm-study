import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var answer: String = ""
    let answerLength: Int = number.count - k
    var previousPickedIndex: Int = -1
    let digitArray: [Int] = Array(number).compactMap({ Int(String($0)) })
    
    for digit in 0..<answerLength {
        var currentMax: Int = digitArray[previousPickedIndex + 1]
        var currentMaxIndex: Int = previousPickedIndex + 1
        
        for candidate in (previousPickedIndex + 1)...(k + digit) {
            if digitArray[candidate] > currentMax {
                currentMax = digitArray[candidate]
                currentMaxIndex = candidate
            }
        }
        
        previousPickedIndex = currentMaxIndex
        answer += "\(currentMax)"
    }
    
    return answer
}

/*
var maxNumber: Int = Int.min

func pickADigit(from range: Range<Int>, pickedDigits: [Int], target: Int, string: String) {
    if pickedDigits.count == target {
        var transformedString: String = ""
        let charArray: [Character] = Array(string)
        
        for pickedDigit in pickedDigits {
            transformedString += "\(charArray[pickedDigit])"
        }
        
        if let transformedNumber: Int = Int(transformedString) {
            maxNumber = max(maxNumber, transformedNumber)
        }
        
        return
    }
    else {
        for candidate in range {
            pickADigit(from: (candidate + 1)..<range.upperBound, pickedDigits: pickedDigits + [candidate], target: target, string: string)
        }
    }
}

func solution(_ number:String, _ k:Int) -> String {
    pickADigit(from: 0..<number.count, pickedDigits: [], target: number.count - k, string: number)
    return "\(maxNumber)"
}
*/

// 문제 링크: https://www.acmicpc.net/problem/1463
import Foundation

let maxNumber: Int = 1_000_000
var dynamicTable: [Int] = Array(repeating: -1, count: maxNumber + 1)
var targetInt: Int = 0

func getInput() {
    if let tempString: String = readLine(), let tempInt: Int = Int(tempString) {
        targetInt = tempInt
    }
}

func fillDynamicTable(till target: Int) {
    // 초기값을 채운다
    dynamicTable[1] = 0
    dynamicTable[2] = 1
    dynamicTable[3] = 1
    
    if target <= 3 {
        return
    }
    
    for number in 4...target {
        var minNumberOfOperations: Int = dynamicTable[number - 1] + 1
        
        if number % 3 == 0 {
            minNumberOfOperations = min(minNumberOfOperations, dynamicTable[number / 3] + 1)
        }
        
        if number % 2 == 0 {
            minNumberOfOperations = min(minNumberOfOperations, dynamicTable[number / 2] + 1)
        }
        
        dynamicTable[number] = minNumberOfOperations
    }
}

func solution() {
    getInput()
    fillDynamicTable(till: targetInt)
    print(dynamicTable[targetInt])
}

solution()

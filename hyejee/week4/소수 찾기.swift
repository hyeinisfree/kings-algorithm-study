import Foundation

var primeNumbers: Set<Int> = []
var isPicked: [Bool] = Array(repeating: false, count: 10)

func checkPrime(_ number: Int) -> Bool {
    if number < 2 {
        return false
    }
    else if number <= 3 {
        return true
    }
    
    for i in 2...(number / 2) {
        if number % i == 0 {
            return false
        }
    }
    
    return true
}

func pickANumber(from numbers: [Character], picked: String, target: Int) {
    if picked.count == target {
        if let number = Int(picked), checkPrime(number) {
            primeNumbers.insert(number)
        }
        return
    }
    
    for (index, value) in numbers.enumerated() {
        if isPicked[index] {
            continue
        }
        
        isPicked[index] = true
        pickANumber(from: numbers, picked: picked + "\(value)", target: target)
        isPicked[index] = false
    }
}

func solution(_ numbers:String) -> Int {
    for length in 1...numbers.count {
        pickANumber(from: Array(numbers), picked: "", target: length)
    }
    
    return primeNumbers.count
}

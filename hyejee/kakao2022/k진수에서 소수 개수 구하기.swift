import Foundation

func convert(_ number: Int, _ base: Int) -> String {
    var convertedString: String = ""
    var _number: Int = number
    
    while _number > 0 {
        convertedString = "\(_number % base)" + convertedString
        _number /= base
    } 
    
    return convertedString
}

func checkPrime(_ number: Int) -> Bool {
    if number < 2 {
        return false
    }
    else if number < 4 {
        return true
    }
    
    let maxDivisor: Int = Int(sqrt(Double(number)))
    for divisor in 2...maxDivisor {
        if number % divisor == 0 {
            return false
        }
    }
    
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    let converted: String = convert(n, k)
    let candidates: [Int] = converted.split(separator: "0").compactMap({ Int(String($0)) })

    var numberOfPrimes: Int = 0
    
    for candidate in candidates {
        if checkPrime(candidate) {
            numberOfPrimes += 1
        }
    }
    
    return numberOfPrimes
}

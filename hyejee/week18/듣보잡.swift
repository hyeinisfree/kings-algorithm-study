func getInput(n: inout Int, m: inout Int, neverHeardOf: inout [String], neverSeenOf: inout [String]) {
    if let tempArr: [Int] = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }) {
        guard tempArr.count == 2 else {
            fatalError("Invalid input")
        }
        
        n = tempArr[0]
        m = tempArr[1]
    }
    
    for _ in 0..<n {
        if let tempString: String = readLine() {
            neverHeardOf.append(tempString)
        }
    }
    
    for _ in 0..<n {
        if let tempString: String = readLine() {
            neverSeenOf.append(tempString)
        }
    }
}

func binarySearch(array: [String], left: Int, right: Int, target: String) -> Bool {
    var lowerBound: Int = left
    var upperBound: Int = right
    
    while lowerBound <= upperBound {
        let middle: Int = (lowerBound + upperBound) / 2
        
        if array[middle] == target {
            return true
        }
        else if array[middle] < target {
            lowerBound = middle + 1
        }
        else {
            upperBound = middle - 1
        }
    }
    
    return false
}

func solution() {
    var n: Int = -1
    var m: Int = -1
    var neverHeardOf: [String] = []
    var neverSeenOf: [String] = []
    
    getInput(n: &n, m: &m, neverHeardOf: &neverHeardOf, neverSeenOf: &neverSeenOf)
    
    var result: [String] = []
    
    neverSeenOf.sort()
    neverHeardOf.sort()
    
    if n < m {
        for name in neverHeardOf {
            if binarySearch(array: neverSeenOf, left: 0, right: m - 1, target: name) {
                result.append(name)
            }
        }
    }
    else {
        for name in neverSeenOf {
            if binarySearch(array: neverHeardOf, left: 0, right: n - 1, target: name) {
                result.append(name)
            }
        }
    }
    
    print(result.reduce(into: "\(result.count)\n", { $0 += "\($1)\n"}))
}

solution()

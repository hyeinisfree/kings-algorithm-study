import Foundation

func rotateKey(_ key: [[Int]]) -> [[Int]] {
    let keySize: Int = key.count
    var rotated: [[Int]] = Array(repeating: Array(repeating: -1, count: keySize), count: keySize)
    
    for row in 0..<keySize {
        for column in 0..<keySize {
            rotated[column][keySize - 1 - row] = key[row][column]
        }
    }
    
    return rotated
}

func unlock(lock: [[Int]], with key: [[Int]]) -> Bool {
    let offset: Int = key.count - 1
    
    for originRow in 0..<(offset + lock.count) {
        for originColumn in 0..<(offset + lock.count) {
            var temp: [[Int]] = Array(repeating: Array(repeating: 0, count: lock.count + key.count * 2 - 2), count: lock.count + key.count * 2 - 2)
            
            for row in 0..<lock.count {
                for column in 0..<lock.count {
                    temp[offset + row][offset + column] += lock[row][column]
                }
            }
            
            for row in 0..<key.count {
                for column in 0..<key.count {
                    temp[row + originRow][column + originColumn] += key[row][column]
                }
            }

            var isUnlocked: Bool = true
            
        check: for row in 0..<lock.count {
                for column in 0..<lock.count {
                    if temp[offset + row][offset + column] != 1 {
                        isUnlocked = false
                        break check
                    }
                }
            }
            
            if isUnlocked {
                return true
            }
        }
    }
    
    return false
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var _key: [[Int]] = key
    
    for _ in 0..<4 {
        _key = rotateKey(_key)
        
        if unlock(lock: lock, with: _key) {
            return true
        }
    }
    
    return false
}

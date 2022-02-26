import Foundation

func solution(_ name: String) -> Int {
    let alphabet: [Character: Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
    
    let characters: [Character] = Array(name)
    
    var changingAlphabetCount: Int = 0
    var changingCursorCount: Int = characters.count - 1
    
    var index: Int = 0
    
    for charater in characters {
        // 알파벳 바꾸는데 들어가는 수 count
        changingAlphabetCount += min(alphabet[charater, default: 0] - alphabet["A", default: 0], alphabet["Z", default: 0] - alphabet[charater, default: 0] + 1)
        
        var temp: Int = index + 1
        
        while temp < characters.count, characters[temp] == "A" {
            temp += 1
        }
        
        changingCursorCount = min(changingCursorCount, index * 2 + characters.count - temp)
        changingCursorCount = min(changingCursorCount, (characters.count - temp) * 2 + index)
        
        index += 1
    }
    
    return changingAlphabetCount + changingCursorCount
}

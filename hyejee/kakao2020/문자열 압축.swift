import Foundation

func solution(_ s:String) -> Int {
    let sCount: Int = s.count
    
    if sCount == 1 {
        return 1
    }
    
    var minCompressedCount: Int = sCount
    let stringArray: [Character] = Array(s)
    
    for unitLength in 1...(sCount / 2) {
        var compressedString: String = ""
        
        var candidate: String?
        var count: Int = 0
        
        var leftIndex: Int = 0
        var rightIndex: Int = 0
        
        while leftIndex < sCount {
            rightIndex = leftIndex + unitLength - 1 >= sCount ? (sCount - 1) : leftIndex + unitLength - 1
            
            if let cand = candidate {
                if String(stringArray[leftIndex...rightIndex]) == cand {
                    count += 1
                }
                else {
                    if count == 1 {
                        compressedString += "\(cand)"
                    }
                    else {
                        compressedString += "\(count)\(cand)"
                    }
                    
                    candidate = String(stringArray[leftIndex...rightIndex])
                    count = 1
                }
            }
            else {
                candidate = String(stringArray[leftIndex...rightIndex])
                count = 1
            }
            
            leftIndex = rightIndex + 1
        }
        
        if let cand = candidate {
            if count == 1 {
                compressedString += "\(cand)"
            }
            else {
                compressedString += "\(count)\(cand)"
            }
        }

        minCompressedCount = min(minCompressedCount, compressedString.count)
    }

    return minCompressedCount
}

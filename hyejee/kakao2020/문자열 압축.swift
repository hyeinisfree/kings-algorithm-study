import Foundation

func solution(_ s: String) -> Int {
    let stringCount: Int = s.count
    
    if stringCount == 1 {
        return 1
    }
    
    var minCompressedStringCount: Int = stringCount
    
    for unitLength in 1...(stringCount / 2) {
        var compressedString: String = ""
        
        let fragments: [String] = s.split(by: unitLength)
        var previousFragment: String = ""
        var count: Int = 0
        
        for fragment in fragments {
            if fragment == previousFragment {
                count += 1
            }
            else {
                if count == 1 {
                    compressedString += "\(previousFragment)"
                }
                else if count > 1 {
                    compressedString += "\(count)\(previousFragment)"
                }
                
                previousFragment = fragment
                count = 1
            }
        }
        
        if count > 1 {
            compressedString += "\(count)\(previousFragment)"
        }
        else {
            compressedString += "\(previousFragment)"
        }
        
        minCompressedStringCount = min(minCompressedStringCount, compressedString.count)
    }
    
    return minCompressedStringCount
}

extension String {
    
    func split(by length: Int) -> [String] {
        var startIndex: Index = self.startIndex
        var result: [Substring] = []
        
        while startIndex < self.endIndex {
            let endIndex: Index = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            result.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        
        return result.map({ String($0) })
    }
    
}

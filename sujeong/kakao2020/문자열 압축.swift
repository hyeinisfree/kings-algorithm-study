import Foundation

func getSubStringsArray(_ len:Int, _ s:String) -> [String] {
    var remain:String = s
    var array:[String] = []
    while remain.count >= len {
        let lenIndex:String.Index = remain.index(remain.startIndex, offsetBy:len)
        array.append(String(remain[..<lenIndex]))
        remain = String(remain[lenIndex...])
    }
    
    array.append(remain)
    return array
}

func getCompactString(_ array:[String], _ remain:String) -> String {
    var compactStr = ""
    var repeatCnt:Int = 1
    for i in 0..<(array.count-1) {
        if array[i] == array[i+1] {
            repeatCnt += 1
        } else {
            if repeatCnt == 1 {
                compactStr += array[i]
            } else {
                compactStr += "\(repeatCnt)\(array[i])"
            }
            repeatCnt = 1
        }
    }
    
    if repeatCnt > 1 {
        compactStr += "\(repeatCnt)\(array.last ?? "")"
    } else if repeatCnt == 1 {
        compactStr += array.last ?? ""
    }
    
    compactStr += remain
    
    return compactStr
}

func getCompactLength(_ len:Int, _ s:String) -> Int {
    
    var array:[String] = getSubStringsArray(len, s)
    let remain:String = array.removeLast() ?? ""
    
    let compactStr:String = getCompactString(array, remain)
    
    return compactStr.count
}

func solution(_ s:String) -> Int {
    
    let lengthOfs = s.count

    var minOfCompactLength = lengthOfs
    
    if lengthOfs < 2 {
        return lengthOfs
    }
    
    for len in 1...lengthOfs/2 {
        let compactLength = getCompactLength(len, s)
        minOfCompactLength = minOfCompactLength > compactLength ? compactLength : minOfCompactLength
    }
    
    return minOfCompactLength
}

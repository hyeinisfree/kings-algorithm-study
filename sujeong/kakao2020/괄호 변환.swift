import Foundation

func solution(_ p:String) -> String {
    return makeCorrectStr(Array(p))
}

func makeCorrectStr(_ w:[Character]) -> String {
    if w.count == 0 {
        return String(w)
    }
    
    let divided:(u:[Character], v:[Character]) = divide(w)
    var u:[Character] = divided.u
    let v:[Character] = divided.v
    
    if isCorrect(u) {
        return String(u) + makeCorrectStr(v)
    } else {
        u.removeFirst()
        u.removeLast()
        return "(" + makeCorrectStr(v) + ")"
        + String(u.map{ $0 == "(" ? ")" : "("})
    }
}

func divide(_ w:[Character]) -> ([Character], [Character]) {
    var openCnt:Int = 0
    var closeCnt:Int = 0
    for (i, ch) in w.enumerated() {
        if ch == "(" {
            openCnt += 1
        } else {
            closeCnt += 1
        }
        if openCnt == closeCnt {
            let u = w[...i]
            let v = w[(i+1)...]
            return (Array(u),Array(v))
        }
    }
    return ([],[])
}

func isCorrect(_ u:[Character]) -> Bool {
    return u.first == "("
//     var stack:Int = 0
//     for ch in u {
//         if ch == "(" {
//             stack += 1
//         } else {
//             stack -= 1
//             if stack < 0 {
//                 return false
//             }
//         }
//     }
    
//     if stack == 0 {
//         return true
//     } else {
//         return false
//     }
}

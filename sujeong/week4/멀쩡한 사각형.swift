import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    
    var a:Int = max(w,h)
    var b:Int = min(w,h)
    var r:Int = b
    
    while b > 0 {
        r = a % b
        a = b
        b = r
    }
    let gcd:Int = a
    
    let entireArea:Int64 = Int64(w*h)
    answer = entireArea - Int64(w + h - gcd)
    return answer
}

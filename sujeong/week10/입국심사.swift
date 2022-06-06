import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    guard let maxTime:Int = times.max() else { return 0 }
    
    var start:Int64 = 1
    var end:Int64 = Int64(maxTime * n)
    var mid:Int64 = (start + end)/2
    
    while start < end {
        mid = (start + end)/2
        var capableN:Int64 = times.reduce(0) { $0 + mid/Int64($1) }
        if capableN >= n {
            end = mid
        } else {
            start = mid+1
        }
    }
    
    return end
}

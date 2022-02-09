import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostt = lost.filter{ !reserve.contains($0) }
    var reservee = reserve.sorted().filter{ !lost.contains($0) }
    
    for r in reservee {
        if let i = lostt.index(of:r-1 < 1 ? 1 : r-1){
            lostt.remove(at:i)
        }else if let i = lostt.index(of:r+1 > n ? n : r+1){
            lostt.remove(at:i)
        }
    }
    
    return n - lostt.count
}

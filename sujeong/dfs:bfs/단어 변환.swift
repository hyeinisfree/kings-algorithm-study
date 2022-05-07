import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    if !words.contains(target) {
        return 0
    }
    
    // bfs
    var visit:[Bool] = Array(repeating: false, count: words.count)
    var queue:[(begin:String, cnt:Int)] = []
    
    queue.append((begin, 0))
    
    while (!queue.isEmpty) {
        let here:(begin:String,cnt:Int) = queue.removeFirst()
        if(here.begin == target){
            return here.cnt
        }
        
        for (idx,word) in words.enumerated() {
            if !visit[idx] && isADifference(here.begin, word) {
                queue.append((word, here.cnt+1))
                visit[idx] = true
            }
        }
    }
    return 0
}

func isADifference(_ begin:String, _ next:String) -> Bool {
    let a:[Character] = Array(begin)
    let b:[Character] = Array(next)
    
    var cnt:Int = 0
    
    for i in 0..<a.count {
        if a[i] != b[i] {
            cnt += 1
            if cnt > 1 {
                return false
            }
        }
    }
    
    if cnt == 1 {
        return true
    }
    return false
}

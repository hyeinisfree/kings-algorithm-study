import Foundation

func getNumOfRemovedStone(_ minGap:Int, _ rocks:[Int]) -> Int {
    var here:Int = 0
    var removeCnt:Int = 0
    for rock in rocks {
        if rock - here < minGap {
            removeCnt += 1
        } else {
            here = rock
        }
    }
    return removeCnt
}

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    var answer:Int = 0
    let sortedRocks:[Int] = rocks.sorted()+[distance]
    
    var start:Int = 0
    var end:Int = distance
    var mid:Int = (start + end)/2
    
    while start <= end {
        mid = (start+end)/2
        
        let removeCnt:Int = getNumOfRemovedStone(mid, sortedRocks)
        if removeCnt > n {
            end = mid-1
        } else {
            start = mid+1
        }
    }
    return end
}

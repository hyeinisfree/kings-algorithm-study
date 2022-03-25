import Foundation

var wall:[[Point]] = [[]]
var gn:Int = 5

struct Point {
    var col:Bool = false
    var beam:Bool = false
}

func isSafe(_ r:Int, _ c:Int) -> Bool {
    if r > gn || c > gn || r < 0 || c < 0 {
        return true
    }
    //기둥 ㅇ
    if wall[r][c].col && !isSafeCol(r, c) {
        return false
    }
    //보 ㅇ
    if wall[r][c].beam && !isSafeBeam(r, c) {
        return false
    }
    return true
}

func isSafeCol(_ r:Int, _ c:Int) -> Bool {
    // 바닥 위
    if r == gn {
        return true
    }
    
    // 보의 한쪽 끝위
    if c-1 >= 0 && wall[r][c-1].beam {
        return true
    }
    if wall[r][c].beam {
        return true
    }
    // 기둥 위
    if r+1 <= gn && wall[r+1][c].col {
        return true
    }
    
    return false
}

func isSafeBeam(_ r:Int, _ c:Int) -> Bool {
    // 한쪽 끝이 기둥 위
    if r+1 <= gn && wall[r+1][c].col {
        return true
    }
    if r+1 <= gn && c+1 <= gn && wall[r+1][c+1].col {
        return true
    }
    
    // 양쪽 끝이 다른 보와 연결
    if c-1 >= 0 && wall[r][c-1].beam && c+1 <= gn && wall[r][c+1].beam {
        return true
    }
    
    return false
}

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var result:[[Int]] = []
    gn = n
    wall = Array(repeating: Array(repeating: Point(), count: n+1), count: n+1)
    
    for query in build_frame {
        let c = query[0]
        let r = n-query[1]
        let a = query[2]
        let b = query[3]
        
        // a -> 기둥 : 0, 보 : 1
        // b -> 삭제 : 0, 설치 : 1
        
        switch a {
        //기둥
        case 0:
            // 기둥 설치
            if b == 1 {
                if isSafeCol(r,c) {
                    wall[r][c].col = true
                }
            }
            // 기둥 삭제
            else {
                wall[r][c].col = false
                if !isSafe(r-1,c-1) || !isSafe(r-1,c) {
                    wall[r][c].col = true
                }
            }
        //보
        case 1:
            // 보 설치
            if b == 1 {
                if isSafeBeam(r,c) {
                    wall[r][c].beam = true
                }
            }
            // 보 삭제
            else {
                wall[r][c].beam = false
                if !isSafe(r,c-1) || !isSafe(r,c) || !isSafe(r,c+1) {
                    wall[r][c].beam = true
                }
            }
        default:
            break
        }
        
    }
    
    for r in 0...gn {
        for c in 0...gn {
            if wall[r][c].beam {
                result.append([c,n-r,1])
            }
            if wall[r][c].col {
                result.append([c,n-r,0])
            }
        }
    }
    
    result.sort {
        if $0[0] == $1[0] {
            if $0[1] == $1[1] {
                return $0[2] < $1[2]
            }
            return $0[1] < $1[1]
        }
        return $0[0] < $1[0]
    }
    return result
}

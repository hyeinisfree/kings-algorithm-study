import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    let m:Int = key.count
    let n:Int = lock.count
    // lock을 정가운데에 위치시킨 board
    let board:[[Int]] = makeBoard(lock, m, n)
    // 90도씩 회전한 key들 (4개)
    let keys:[[[Int]]] = rotateKey(key)
    
    for aKey in keys {
        // startR, StartC = board에서 키의 시작점 : (0,0) ~ (board안의 lock의 마지막 지점)
        for startR in 0..<(n+m-1) {
            for startC in 0..<(n+m-1) {
                // 회전한 키를 가능한 모든 시작 점에서 잠금해제 시도
                let ongoingBoard = getBoardWithKey(aKey, board, n,m,startR, startC)
                if isUnlocked(n,m,ongoingBoard) {
                    return true
                }
            }
        }
    }
    
    return false
}

func makeBoard(_ lock:[[Int]], _ m:Int, _ n:Int) -> [[Int]] {
    // n+2*(m-1)가 한 변의 길이인 정사각형 board
    var board:[[Int]] = Array(repeating:Array(repeating:0, count:n+2*(m-1)), count: n+2*(m-1))
    // board에 lock 정중앙 위치시키기
    // lock의 시작 위치
    var sr = m-1
    var sc = m-1
    for r in 0..<n {
        for c in 0..<n {
            board[sr+r][sr+c] = lock[r][c]
        }
    }
    return board
}

func rotateKey(_ key:[[Int]]) -> [[[Int]]] {
    var result:[[[Int]]] = []
    result.append(key)

    var preKey = key
    for _ in 1..<4 {
        var rotatedKey:[[Int]] = []
        for c in 0..<key.count {
            // 세로로 한줄씩 배열에 담아 newKey에 가로 한줄로 추가
            var row:[Int] = []
            for r in 0..<key.count {
                row.append(preKey[r][c])
            }
            rotatedKey.append(row.reversed())
        }
        result.append(rotatedKey)
        preKey = rotatedKey
    }
    return result
}

func getBoardWithKey(_ key:[[Int]], _ board:[[Int]], _ n:Int, _ m:Int, _ sr:Int, _ sc:Int) -> [[Int]] {
    var board = board
    // lock이 정중앙에 있는 board에 key 넣기
    for dr in 0..<m {
        for dc in 0..<m {
            board[sr+dr][sc+dc] += key[dr][dc]
        }
    }
    return board
}

func isUnlocked(_ n:Int, _ m:Int, _ board:[[Int]]) -> Bool {
    // lock start row,col : board에서 lock이 시작하는 위치
    let lsr:Int = m-1
    let lsc:Int = m-1
    
    // unlock 확인
    for dr in 0..<n {
        for dc in 0..<n {
            if board[lsr+dr][lsc+dc] != 1 {
                return false
            }
        }
    }
    return true
}

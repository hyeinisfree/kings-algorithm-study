import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var varBoard:[[Int]] = board
    
    for task in skill {
        let info:(type:Int, r1:Int, c1:Int, r2:Int, c2:Int, degree:Int) = (task[0], task[1], task[2], task[3], task[4], task[5])
        
        let degree:Int = info.type == 1 ? -info.degree : info.degree
        for r in info.r1...info.r2 {
            for c in info.c1...info.c2 {
                varBoard[r][c] += degree
            }
        }
    }
    
    let answer:Int = varBoard.flatMap{ $0 }.filter{ $0 > 0 }.count

    return answer
}

func solution2(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var deltaBoard:[[Int]] = Array(repeating: Array(repeating: 0, count: board[0].count + 1), count: board.count + 1)
    
    for task in skill {
        let info:(type:Int, r1:Int, c1:Int, r2:Int, c2:Int, degree:Int) = (task[0], task[1], task[2], task[3], task[4], task[5])
        let degree:Int = info.type == 1 ? -info.degree : info.degree
        
        deltaBoard[info.r1][info.c1] += degree
        deltaBoard[info.r2+1][info.c2+1] += degree
        deltaBoard[info.r1][info.c2+1] -= degree
        deltaBoard[info.r2+1][info.c1] -= degree
    }
    
    for row in 0..<deltaBoard.count-1 {
        for col in 0..<deltaBoard[0].count {
            deltaBoard[row+1][col] += deltaBoard[row][col]
        }
    }
    
    for col in 0..<deltaBoard[0].count-1 {
        for row in 0..<deltaBoard.count {
            deltaBoard[row][col+1] += deltaBoard[row][col]
        }
    }
        
    var answer:Int = 0
    for r in 0..<board.count {
        for c in 0..<board[0].count {
            if board[r][c] + deltaBoard[r][c] > 0 {
                answer += 1
            }
        }
    }
    return answer
}

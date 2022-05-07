import Foundation

let dir:[[Int]] = [[0,1], [0,-1], [1,0], [-1,0]]
var visit:Set<Status> = []

struct Card:Hashable {
    let r:Int
    let c:Int
    let num:Int
}

struct Status:Hashable{
    let board:[[Int]]
    let r:Int
    let c:Int
    let openCard:Card?
    
    init (_ board:[[Int]], _ r:Int, _ c:Int, _ openCard:Card?) {
        self.board = board
        self.r = r
        self.c = c
        self.openCard = openCard
    }
}

func isAllCardOpened(_ cBoard:[[Int]]) -> Bool {
    for card in Array(cBoard.flatMap{$0}) {
        if card != 0 {
            return false
        }
    }
    
    return true
}

func isOnEnd(_ r:Int, _ c:Int, _ dir:Int) -> Bool {
    if (dir == 0 && c == 3) ||
    (dir == 1 && c == 0) ||
    (dir == 2 && r == 3) ||
    (dir == 3 && r == 0) {
        return true
    } else {
        return false
    }
}

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    var queue:[(status:Status, moveCnt:Int)] = []
    
    queue.append((Status(board,r,c,nil),0))
    visit.insert(Status(board,r,c,nil))
        
    while !queue.isEmpty {
        let q = queue.removeFirst()
        
        var cBoard:[[Int]] = q.status.board
        let cr:Int = q.status.r
        let cc:Int = q.status.c
        let openCard:Card? = q.status.openCard
        let moveCnt:Int = q.moveCnt

        // 방향키
        for d in dir {
            let nr:Int = cr + d[0]
            let nc:Int = cc + d[1]
            if nr < 0 || nr > 3 || nc < 0 || nc > 3 {
                continue
            } else if visit.contains(Status(cBoard,nr,nc,openCard)) {
                continue
            } else {
                queue.append((Status(cBoard,nr,nc,openCard), moveCnt+1))
                visit.insert(Status(cBoard,nr,nc,openCard))
            }
        }

        // ctrl + 방향키
        for (i,d) in dir.enumerated() {
            
            var nr:Int = cr + d[0]
            var nc:Int = cc + d[1]
            
            if nr < 0 || nr > 3 || nc < 0 || nc > 3 {
                continue
            }
            
            while cBoard[nr][nc] == 0 && !isOnEnd(nr,nc,i) {
                nr = nr + d[0]
                nc = nc + d[1]
            }
            
            if visit.contains(Status(cBoard,nr,nc,openCard)) {
                continue
            } else {
                queue.append((Status(cBoard,nr,nc,openCard), moveCnt+1))
                visit.insert(Status(cBoard,nr,nc,openCard))
            }
        }
        
        // open
        // 짝을 맞출 카드가 있을 경우
        if let openedCard = openCard {
            // 짝 맞음
            if openedCard.num == cBoard[cr][cc] && !(openedCard.r == cr && openedCard.c == cc) {
                cBoard[openedCard.r][openedCard.c] = 0
                cBoard[cr][cc] = 0
                
                if isAllCardOpened(cBoard) {
                    return moveCnt+1
                }
                
                visit.insert(Status(cBoard,cr,cc,nil))
                queue.append((Status(cBoard,cr,cc,nil),moveCnt+1))
            }
            // 짝 틀림
            else {
                if visit.contains(Status(cBoard,cr,cc,openCard)) {
                    continue
                } else {
                    queue.append((Status(cBoard,cr,cc,nil), moveCnt+1))
                    visit.insert(Status(cBoard,cr,cc,nil))
                }
            }
        }
        // 새로 카드를 오픈할 때
        else {
            let newOpenCard = Card(r:cr, c:cc, num:cBoard[cr][cc])
            
            if visit.contains(Status(cBoard,cr,cc,newOpenCard)) {
                continue
            }
            queue.append((Status(cBoard,cr,cc,newOpenCard), moveCnt+1))
            visit.insert(Status(cBoard,cr,cc,newOpenCard))
        }
    }
    return Int.max
}

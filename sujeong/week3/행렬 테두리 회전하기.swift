import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var answer:[Int] = []
    var directions:[String:[Int]] = ["N":[-1,0],"S":[1,0],"W":[0,-1],"E":[0,1]]
    
    var grid:[[Int]] = Array(repeating: Array(repeating:0, count:columns), count:rows)
    for r in 0..<rows {
        for c in 0..<columns {
            grid[r][c] = (r*columns + c+1)
        }
    }
    
    for query in queries {
        var x1: Int = query[0]-1
        var y1: Int = query[1]-1
        var x2: Int = query[2]-1
        var y2: Int = query[3]-1
        
        var cr: Int = x1
        var cc: Int = y1
        
        var direction: String = "E"
        var min: Int = grid[cr][cc]
        var before: Int = grid[cr][cc]
        var temp: Int = before
        repeat {
            min = grid[cr][cc] < min ? grid[cr][cc] : min
            
            if cr == x1 && cc == y2 {
                direction = "S"
            } else if cr == x2 && cc == y2 {
                direction = "W"
            } else if cr == x2 && cc == y1 {
                direction = "N"
            }
            
            temp = grid[cr][cc]
            grid[cr][cc] = before
            before = temp
            
            cr += directions[direction]![0]
            cc += directions[direction]![1]
            
        } while !(cr == x1 && cc == y1)
        grid[cr][cc] = before
        answer.append(min)
    }
    
    return answer
}

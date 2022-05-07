import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ks: [Int] = []
    for command in commands {
        let start = command[0]-1
        let end = command[1]-1
        let k = command[2]-1
        
        let subArray = array[start...end].sorted()
        ks.append(subArray[k])
    }
    
    // 위의 for문과 같은 동작 : 시간 더 소요
    for command in commands {
        ks.append(array[command[0]-1...command[1]-1].sorted()[command[2]-1])
    }
    return ks
}

// map 사용
func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map { array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1] }
}

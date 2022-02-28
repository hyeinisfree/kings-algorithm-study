import Foundation

func makeProgressOfADay(_ works: inout [Int], _ speeds: [Int]) {
    for (index, value) in works.enumerated() {
        if value >= 100 {
            continue
        }
        else {
            works[index] = value + speeds[index]
        }
    }
}

func checkReleasing(_ works: inout [Int], _ speeds: inout [Int]) -> Int {
    var releaseCount: Int = 0
    
    for work in works {
        if work < 100 {
            break
        }
        
        works.removeFirst()
        speeds.removeFirst()
        releaseCount += 1
    }
    
    return releaseCount
}

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var works: [Int] = progresses
    var _speeds: [Int] = speeds
    var releaseSchedule: [Int] = []
    
    // 작업 큐가 빌 때까지
    // 모든 개발이 덜 된 작업들을 개발하고
    // 선행되야 하는 작업부터 개발이 완료되었는지 확인
    // 개발이 안 된 작업이 있다면 뒤에 작업들은 확인할 필요 없음
    // 작업의 최대 수: 100, 작업 진도 최소: 1, 작업 속도 최소: 1
    // 100일 * (100번 작업 진도 올리는 연산 + 1번 배포 확인 연산) -> 1초 안에 푸는거 가능
    while !works.isEmpty {
        makeProgressOfADay(&works, _speeds)
        
        let releaseCount = checkReleasing(&works, &_speeds)
        
        if releaseCount != 0 {
          releaseSchedule.append(releaseCount)
        }
    }
    
    return releaseSchedule
}

func solution2(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var releaseSchedule: [Int] = []
    var maxNeededDays: Int = 0
    
    for index in 0..<progresses.count {
        let progress: Double = Double(progresses[index])
        let speed: Double = Double(speeds[index])
        let neededDays: Int = Int(ceil((100 - progress) / speed))
        
        if neededDays > maxNeededDays {
            maxNeededDays = neededDays
            releaseSchedule.append(1)
        }
        else {
            releaseSchedule[releaseSchedule.count - 1] += 1
        }
    }
    
    return releaseSchedule
}

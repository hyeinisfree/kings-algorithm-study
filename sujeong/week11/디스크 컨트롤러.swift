import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var sumOfProcessTime:Int = 0
    var now:Int = 0
    
    var sortedJobs:[[Int]] = jobs.sorted(by: {
        $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]
    })
        
    var task = sortedJobs[0]
    sortedJobs.removeFirst()
    sumOfProcessTime += task[1]
    now = task[0]+task[1]
    
    sortedJobs.sort(by: {
        $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1]
    })
    
    while !sortedJobs.isEmpty {
        var removeJob:Bool = false
        for i in 0..<sortedJobs.count {
            if sortedJobs[i][0] <= now {
                sumOfProcessTime += (now-sortedJobs[i][0]) + sortedJobs[i][1]
                now += sortedJobs[i][1]
                sortedJobs.remove(at:i)
                removeJob = true
                break
            }
        }
        if !removeJob {
            now += 1
        }
    }
    
    return sumOfProcessTime/jobs.count
}

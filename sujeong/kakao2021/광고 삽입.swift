import Foundation

var timeline:[Double] = []
func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    
    if play_time == adv_time {
        return "00:00:00"
    }
    
    let play_time_sec = getSecondsOf(play_time)
    
    timeline = Array(repeating: 0, count:play_time_sec+1)
    
    let adv_time_sec = getSecondsOf(adv_time)
    
    for log in logs {
        let log_components = log.components(separatedBy:"-")
        let start = getSecondsOf(log_components[0])
        let end = getSecondsOf(log_components[1])
        timeline[start] += 1
        timeline[end] -= 1
    }
    
    for sec in 1...play_time_sec {
        timeline[sec] += timeline[sec-1]
    }
    
    var sumOfPlay = timeline[0..<adv_time_sec].reduce(0,+)
    
    var maxSumOfPlay:Double = sumOfPlay
    
    var startSecond = 0
    
    for i in adv_time_sec..<play_time_sec {

        sumOfPlay += timeline[i] - timeline[i - adv_time_sec]
        
        if maxSumOfPlay < sumOfPlay {
            maxSumOfPlay = sumOfPlay
            startSecond = i - adv_time_sec + 1
        }
    }
    
    
    let result:String = getTimeStringOf(startSecond)
    return result
}

func getSecondsOf(_ time:String) -> Int{
    let times = time.components(separatedBy:":")
    let hour = Int(times[0])!*3600
    let min = Int(times[1])!*60
    let sec = Int(times[2])!
    
    return hour + min + sec
}

func getTimeStringOf(_ seconds:Int) -> String {
    var result:String = ""
    
    var second = seconds
    
    let hour:Int = second / 3600
    second %= 3600
    let min:Int = second / 60
    second %= 60
    
    result += hour < 10 ? "0\(hour):" : "\(hour):"
    result += min < 10 ? "0\(min):" : "\(min):"
    result += second < 10 ? "0\(second)" : "\(second)"

    return result
}

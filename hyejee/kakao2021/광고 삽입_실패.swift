import Foundation

func convertToSeconds(_ time: String) -> Int {
    let parsed: [Int] = time.split(separator: ":").compactMap({ Int(String($0)) })
    
    return parsed[2] + (parsed[1] * 60) + (parsed[0] * 60 * 60)
}

func convertToString(_ seconds: Int) -> String {
    var _seconds: Int = seconds
    
    let hour: Int = _seconds / (60 * 60)
    let hourString: String = hour >= 10 ? "\(hour)" : "0\(hour)"
    
    _seconds = _seconds % (60 * 60)
    
    let minutes: Int = _seconds / 60
    let minuteString: String = minutes >= 10 ? "\(minutes)" : "0\(minutes)"
    
    _seconds = _seconds % 60
    let secondString: String = _seconds >= 10 ? "\(_seconds)" : "0\(_seconds)"
    
    return "\(hourString):\(minuteString):\(secondString)"
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    let playTimeInSeconds: Int = convertToSeconds(play_time)
    let advTimeInSeconds: Int = convertToSeconds(adv_time)
    
    var playCount: [Int] = Array(repeating: 0, count: playTimeInSeconds + 1)
    
    for log in logs {
        let timeArray: [String] = log.components(separatedBy: "-")
        let startTimeInSeconds: Int = convertToSeconds(timeArray[0])
        let endTimeInSeconds: Int = convertToSeconds(timeArray[1])
        
        for index in startTimeInSeconds..<endTimeInSeconds {
            playCount[index] += 1
        }
    }
    
    var maxStart: Int = 0
    var maxCount: Int = -1
    
    var left: Int = 0
    var total: Int = 0
    
    for right in advTimeInSeconds...playTimeInSeconds {
        if right - left == advTimeInSeconds {
            if maxCount < total {
                maxCount = total
                maxStart = left
            }
            
            total += playCount[right]
            total -= playCount[left]
            
            left += 1
        }
        else {
            total += playCount[right]
            continue
        }
    }
    
    return convertToString(maxStart)
}

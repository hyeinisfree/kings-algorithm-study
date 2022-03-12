import Foundation

class Record {
    let inTime: Int
    var outTime: Int = (23 * 60 + 59)
    var accumulatedMinutes: Int {
        return self.outTime - self.inTime
    }
    
    init(inTime: Int) {
        self.inTime = inTime
    }
}

func parseRecord(of record: String) -> (Int, String, String)? {
    let strings: [String] = record.split(separator: " ").map({ String($0) })
    
    guard strings.count == 3 else {
        return nil
    }
    
    // 시간 계산
    let times: [Int] = strings[0].split(separator: ":").compactMap({ Int(String($0)) })
    guard times.count == 2 else {
        return nil
    }
    
    let minutes: Int = times[0] * 60 + times[1]
    
    return (minutes, strings[1], strings[2])
}

func calculateFee(of minutes: Int, _ fees: [Int]) -> Int {
    var extra: Int = 0
    
    if minutes -  fees[0] > 0 {
        extra = Int(ceil(Double(minutes - fees[0]) / Double(fees[2]))) * fees[3]
    }
    
    return fees[1] + extra
}

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var _records: [String: [Record]] = [:]
    
    for record in records {
        guard let parsed: (Int, String, String) = parseRecord(of: record) else {
            continue
        }
        
        switch parsed.2 {
        case "IN":
            _records[parsed.1, default: []].append(Record(inTime: parsed.0))
        case "OUT":
            if let last = _records[parsed.1, default: []].last {
                last.outTime = parsed.0
            }
        default:
            return []
        }
    }
    
    var answer: [Int] = []
    
    for carNumber in _records.keys.sorted() {
        let minutes: Int = _records[carNumber, default: []].map({ $0.accumulatedMinutes }).reduce(into: 0) {
            $0 += $1
        }
        
        let fee: Int = calculateFee(of: minutes, fees)
        
        answer.append(fee)
    }
    
    return answer
}

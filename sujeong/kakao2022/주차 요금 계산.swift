import Foundation

let MAX_OUT_TIME:Int = 23*60 + 59

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let minOfUse:[String:Int] = getMinutesOfUse(records)
    let expenses:[String:Int] = getExpenses(minOfUse, fees)
    let result:[Int] = expenses.sorted {$0.key < $1.key }.map{ $0.value }
    return result
}

func getMinutesOfUse(_ records:[String]) -> [String:Int] {
    var minOfUse:[String:Int] = [:]
    var stack:[String:[Int]] = [:]
    
    for record in records {
        let recordArr: [String] = record.components(separatedBy:" ")
        let time:Int = getMinutesOf(recordArr[0])
        let carNum:String = recordArr[1]
        if recordArr[2] == "IN" {
            stack[carNum] = [time]
        } else {
            let usingMin:Int = time - (stack[carNum]!.removeLast())
            if minOfUse[carNum] == nil {
                minOfUse[carNum] = usingMin
            } else {
                minOfUse[carNum]? += usingMin
            }
        }
    }
    
    for car in stack {
        if !car.value.isEmpty {
            let usingMin:Int = MAX_OUT_TIME - car.value[0]
            let carNum:String = car.key
            if minOfUse[carNum] == nil {
                minOfUse[carNum] = usingMin
            } else {
                minOfUse[carNum]? += usingMin
            }
        }
    }
    
    return minOfUse
}

func getMinutesOf(_ time:String) -> Int {
    let hourMin:[Int] = time.components(separatedBy:":").map{ Int($0) ?? 0 }
    return hourMin[0]*60 + hourMin[1]
}

func getExpenses(_ minOfUse:[String:Int], _ fees:[Int]) -> [String:Int] {
    return minOfUse.mapValues {
        if $0 <= fees[0] {
            return fees[1]
        } else {
            return fees[1] + Int(ceil(Double($0 - fees[0])/Double(fees[2])))*fees[3]
        }
    }
}

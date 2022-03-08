import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reporterList:[String:Set<String>] = [:]
    id_list.forEach { reporterList[$0] = [] }
    
    var numsOfSendingMail:[String:Int] = [:]
    id_list.forEach { numsOfSendingMail[$0] = 0 }
    
    for r in report {
        let reporterAndRespondent:[String] = r.components(separatedBy:" ")
        let reporter:String = reporterAndRespondent[0]
        let respondent:String = reporterAndRespondent[1]
        reporterList[respondent]!.insert(reporter)
    }
    
    reporterList.forEach {
        if $0.value.count >= k {
            for reporter in $0.value {
                numsOfSendingMail[reporter]! += 1
            }
        }
    }
    
    return id_list.map { numsOfSendingMail[$0]! }
}

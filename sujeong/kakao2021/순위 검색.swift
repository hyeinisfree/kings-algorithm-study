import Foundation

var infoDic:[String:[Int]] = [String:[Int]]()

func solution(_ info:[String], _ query:[String]) -> [Int] {
    makeInfoDic(info)
    sortInfoDicValues()
    let result:[Int] = makeResult(query)
    return result
}

func makeInfoDic(_ infos:[String]) {
    for info in infos {
        var infoToArray:[String] = info.components(separatedBy:" ")
        let applicantScore:Int = Int(infoToArray.last ?? "0") ?? 0
        infoToArray.removeLast()
        
        addApplicantInfoToInfoDic(0, "", infoToArray, applicantScore)
    }
}

func addApplicantInfoToInfoDic(_ index:Int, _ infoStr:String, _ info:[String], _ applicantScore:Int){
    if index == info.count {
        if infoDic[infoStr] == nil {
            infoDic[infoStr] = [applicantScore]
        } else {
            infoDic[infoStr]?.append(applicantScore)
        }
        return
    }
    addApplicantInfoToInfoDic(index+1, infoStr+info[index], info, applicantScore)
    addApplicantInfoToInfoDic(index+1, infoStr+"-", info, applicantScore)
}

func sortInfoDicValues() {
    for (info, scores) in infoDic {
        infoDic[info] = scores.sorted()
    }
}

func makeResult(_ query:[String]) -> [Int] {
    var result:[Int] = [Int]()
    
    for q in query {
        let componentsOfQuery:[String] = q.components(separatedBy:" ").filter{$0 != "and"}
        let queryScore:Int = Int(componentsOfQuery.last ?? "0") ?? 0
        let queryString:String = componentsOfQuery[..<(componentsOfQuery.count-1)].joined()
        result.append(getNumOfApplicantMatchedToQuery(queryString, queryScore))
    }
    
    return result
}

func getNumOfApplicantMatchedToQuery(_ query:String, _ queryScore:Int) -> Int {
    if infoDic[query] != nil {
        return infoDic[query]!.count - getLowerBound(infoDic[query]!, queryScore)
    } else {
        return 0
    }
}

func getLowerBound(_ array:[Int], _ target:Int) -> Int {
    var start = 0
    var end = array.count
    
    while start < end {
        let mid: Int = (start + end) / 2
        if target <= array[mid] {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}

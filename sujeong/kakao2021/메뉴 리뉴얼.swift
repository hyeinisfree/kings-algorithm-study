import Foundation

var survey:[String:Int] = [String:Int]()

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    var result:[String] = []
    let ordersArr:[[Character]] = orders.map{ Array($0).sorted() }
    
    for neededNumOfMenu in course {
        survey = [:]
        for order in ordersArr {
            getCourse(-1, order, "", neededNumOfMenu)
        }
        result += selectFinalCourse()
    }

    return result.sorted()
}

func getCourse(_ index:Int, _ order:[Character], _ course:String, _ neededNumOfMenu:Int) {
    if course.count == neededNumOfMenu {
        survey[course] = survey[course] == nil ? 1 : survey[course]! + 1
        return
    }
    
    for i in index+1..<order.count {
        getCourse(i, order, "\(course)\(order[i])", neededNumOfMenu)
    }
}

func selectFinalCourse() -> [String] {
    let maxCount:Int = survey.values.max() ?? 0
    if maxCount >= 2 {
        return Array(survey.filter{ $0.value == maxCount }.keys)
    }
    return []
}

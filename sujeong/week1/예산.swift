import Foundation

func solution1(_ d:[Int], _ budget:Int) -> Int {
    var sumOfCost: Int = 0
    var deptCnt: Int = 0
    let costs = d.sorted()
    
    for cost in costs {
        let preSumOfCost: Int = sumOfCost + cost
        if preSumOfCost <= budget {
            sumOfCost = preSumOfCost
            deptCnt += 1
        } else { break }
    }
    
    return deptCnt
}

func solution2(_ d:[Int], _ budget:Int) -> Int {
    var varBudget: Int = budget
    var deptCnt: Int = 0
    let costs: [Int] = d.sorted()
    
    while deptCnt < d.count && varBudget - costs[deptCnt] >= 0 {
        varBudget -= costs[deptCnt]
        deptCnt += 1
    }
    
    return deptCnt
}

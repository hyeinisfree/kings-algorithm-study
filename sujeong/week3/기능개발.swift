import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer:[Int] = []
    var datesNeededList:[Int] = []
    
    for (index,progress) in progresses.enumerated() {
        let datesNeeded = Int(ceil((Double(100-progress)/Double(speeds[index]))))
        datesNeededList.append(datesNeeded)
    }
    
    var currentReleaseDate:Int = datesNeededList[0]
    var numOfRelease:Int = 0
    for datesNeeded in datesNeededList {
        if datesNeeded <= currentReleaseDate {
            numOfRelease += 1
        } else {
            answer.append(numOfRelease)
            numOfRelease = 1
            currentReleaseDate = datesNeeded
        }
    }
    answer.append(numOfRelease)

    return answer
}

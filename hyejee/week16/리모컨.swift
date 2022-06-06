import Foundation

let maxChannel: Int = 1_000_000

var targetChannel: Int = 0
var numberOfBrokenButtons: Int = 0
var buttonAvailability: [String: Bool] = [:]

func getInput() {
    if let tempString: String = readLine(), let tempInt: Int = Int(tempString) {
        targetChannel = tempInt
    }
    
    if let tempString: String = readLine(), let tempInt: Int = Int(tempString) {
        numberOfBrokenButtons = tempInt
    }
    
    if numberOfBrokenButtons > 0 {
        if let tempArray: [Int] = readLine()?.split(separator: " ").compactMap({ Int(String($0)) }) {
            tempArray.forEach {
                buttonAvailability["\($0)"] = false
            }
        }
    }
}

func checkNumberButtons(for number: Int) -> Bool {
    let characterArray: [Character] = Array("\(number)")
    
    for characterArray in characterArray {
        if !buttonAvailability["\(characterArray)", default: true] {
            return false
        }
    }
    
    return true
}

func calculateNumberOfClicks(from channel: Int, to target: Int = targetChannel) -> Int {
    if checkNumberButtons(for: channel) { // 숫자 버튼을 눌러 채널로 갈 수 있는 경우
        let numberOfDigitsOfNumber: Int = "\(channel)".count
        let numberOfClicksToChannel: Int = abs(channel - 100)
        let numberOfClicksOfPlusOrMinusButton: Int = abs(channel - target)
        
        return numberOfDigitsOfNumber > numberOfClicksToChannel ? numberOfClicksToChannel + numberOfClicksOfPlusOrMinusButton : numberOfDigitsOfNumber + numberOfClicksOfPlusOrMinusButton
    }
    else { // 고장난 숫자 버튼이 있는 경우
        let numberOfClicksToChannel: Int = abs(channel - 100)
        let numberOfClicksOfPlusOrMinusButton: Int = abs(channel - target)
        
        return numberOfClicksToChannel + numberOfClicksOfPlusOrMinusButton
    }
}

func solution() {
    getInput()
    
    if targetChannel == 100 {
        print(0)
        return
    }
    
    var minNumberOfClicks: Int = Int.max
    
    for channel in 0...maxChannel {
        minNumberOfClicks = min(minNumberOfClicks, calculateNumberOfClicks(from: channel))
    }
    
    print(minNumberOfClicks)
}

solution()
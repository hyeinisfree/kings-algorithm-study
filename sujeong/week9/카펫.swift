import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {

    for yellowHeight in 1...Int(sqrt(Double(yellow))) {
        if yellow % yellowHeight == 0 {
            let yellowWidth = yellow/yellowHeight
            
            let numOfBrown = yellowHeight*2 + yellowWidth*2 + 4
            
            if brown == numOfBrown {
                return [yellowWidth+2, yellowHeight+2]
            }
        }
    }
    return []
}

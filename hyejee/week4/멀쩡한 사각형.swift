import Foundation

func solution(_ w:Int, _ h:Int) -> Int64 {
    var splitCount: Int = 0
    var gradient: Double = Double(h) / Double(w)

    for column in 0..<w {
        let leftYValue: Double = Double(h) * Double(column) / Double(w) 
        let rightYValue: Double = Double(h) * Double(column + 1) / Double(w) 

        let startRow: Int = Int(floor(leftYValue))
        let endRow: Int = Int(ceil(rightYValue))

        splitCount += endRow - startRow
    }

    return Int64(w * h - splitCount) < 0 ? 0 : Int64(w * h - splitCount)
}

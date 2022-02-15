import Foundation

// 최초풀이
func solution(_ sizes:[[Int]]) -> Int {
    
    var maxOfMaxLength: Int = 0
    var maxOfMinLength: Int = 0
    
     for size in sizes {
         let maxLength = max(size[0], size[1])
         let minLength = min(size[0], size[1])
         if maxLength > maxOfMaxLength {
             maxOfMaxLength = maxLength
         }
         if minLength > maxOfMinLength {
             maxOfMinLength = minLength
         }
     }
    
    return maxOfMaxLength * maxOfMinLength
}

// 개선 풀이1
func solution2(_ sizes:[[Int]]) -> Int {
    
    let maxOfMaxLength: Int = sizes.map{ $0.max() ?? 0 }.max() ?? 0
    let maxOfMinLength: Int = sizes.map{ $0.min() ?? 0 }.max() ?? 0
    
    return maxOfMaxLength * maxOfMinLength
}

// 간략 코드
func solution3(_ sizes:[[Int]]) -> Int {
    return (sizes.map{ $0.max() ?? 0 }.max() ?? 0) * (sizes.map{ $0.min() ?? 0 }.max() ?? 0)
}

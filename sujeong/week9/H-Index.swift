import Foundation

func solution(_ citations:[Int]) -> Int {
    
    let sortedCitations:[Int] = citations.sorted().reversed()
        
    for (i, cit) in sortedCitations.enumerated() {
        if i >= cit {
            return i
        }
    }
    
    return citations.count
}

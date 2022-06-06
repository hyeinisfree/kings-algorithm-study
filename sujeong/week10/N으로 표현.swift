import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    
    var setOf:[Set<Int>] = Array(repeating: Set<Int>(), count:9)
    
    for i in 1...8 {
        setOf[i].insert(getConcat(N, i))
        
        if setOf[i].contains(number) { return i }
        if i == 1 { continue }
        
        for j in 1...(i-1) {
            for op1 in setOf[j] {
                for op2 in setOf[i-j] {
                    setOf[i].insert(op1 + op2)
                    setOf[i].insert(op1 - op2)
                    setOf[i].insert(op1 * op2)
                    if op2 != 0 {
                        setOf[i].insert(op1/op2)
                    }
                }
            }
        }
        if setOf[i].contains(number) { return i }
    }
    return -1
}

func getConcat(_ N:Int, _ i:Int) -> Int {
    var result:Int = 0
    for n in 0..<i {
        result = result*10 + N
    }
    return result
}

//
//  리모컨.swift
//  kings-algorithm-project
//
//  Created by 임수정 on 2022/06/05.
//

import Foundation

let NString:String = readLine()!
let digitNum:Int = NString.count
let N:Int = Int(NString)!

let numOfOut:Int = Int(readLine()!)!
var outBtns:[Int] = []
if numOfOut > 0 {
    outBtns = (readLine()!).components(separatedBy: " ").map{ Int($0)! }
}

var availables:[Int] = [0...9].flatMap{ $0 }.filter{ !outBtns.contains($0) }
var minResult:Int = abs(100 - N)

// process

if availables.isEmpty {
    print(minResult)
    exit(0)
}

var Nminus1digits:[Int] = Array(repeating: availables.max()!, count: digitNum-1)
let Nminus1Result:Int = Nminus1digits.reduce(0) { $0 * 10 + $1 }
if digitNum > 1 {
    minResult = min(minResult, abs(Nminus1Result-N)+digitNum-1)
}

func dfs(_ result:[Int], _ n:Int) {
    if result.count == n {
        let resultNum:Int = result.reduce(0) { $0 * 10 + $1 }
        minResult = min(abs(resultNum - N)+n, minResult)
        return
    }
    availables.forEach { dfs(result + [$0], n) }
}

dfs([], digitNum)
dfs([], digitNum+1)

// output

print(minResult)

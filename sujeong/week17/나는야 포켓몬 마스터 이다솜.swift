//
//  나는야 포켓몬 마스터 이다솜.swift
//  kings-algorithm-project
//
//  Created by 임수정 on 2022/06/05.
//

import Foundation

let inputs = readLine()?.split(separator: " ")
let N:Int = Int(inputs![0])!
let M:Int = Int(inputs![1])!

var dic:[String:Int] = [:]
var arr:[String] = Array(repeating: "", count: N+1)
for i in 1...N {
    let name:String = readLine()!
    dic[name] = i
    arr[i] = name
}

for _ in 1...M {
    let query:String = readLine()!
    if query.allSatisfy{ $0.isNumber } {
        let idx:Int = Int(query)!
        print(arr[idx])
    } else {
        print(dic[query]!)
    }
}

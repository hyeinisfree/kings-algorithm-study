import Foundation

func solution1(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted {
        let index0 = $0.index($0.startIndex, offsetBy: n)
        let index1 = $1.index($1.startIndex, offsetBy: n)
        if $0[index0] == $1[index1] { return $0 < $1 }
        else { return $0[index0] < $1[index1] }
    }
}

func solution2(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted { Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n] }
}

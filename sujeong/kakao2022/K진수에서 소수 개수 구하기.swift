import Foundation

func isPrime(_ n:Int) -> Bool {
    if n < 2 {
        return false
    } else if n <= 3 {
        return true
    }

    for d in 2...(Int(sqrt(Double(n)))) {
        if n % d == 0 {
            return false
        }
    }

    return true
}

func getBaseKStringFrom(_ dec:Int, _ k:Int) -> String {
    var result:String = ""
    var _dec:Int = dec

    while _dec > 0 {
        result = "\(_dec % k)" + result
        _dec /= k
    }

    return result
}

func solution(_ n:Int, _ k:Int) -> Int {
    let kString:String = getBaseKStringFrom(n, k)
    let PList:[Int] = kString.components(separatedBy:"0").compactMap{ Int($0) }.filter{ isPrime($0) }
    return PList.count
}

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var option: [String: [String]] = [:]

    // parse clothes array
    for _clothes in clothes {
        option[_clothes[1], default: []].append(_clothes[0])
    }

    // calculate combination
    var answer: Int = 1

    for listOfOptions in option.values {
        // choose one option in listOfOptions or choose none
        answer *= (1 + listOfOptions.count)
    }

    // remove a case that choose nothing
    answer -= 1

    return answer
}

import Foundation

class Node {
    var childs:[Character:Node] = [:]
    var cnt:Int = 0
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var tries:[Int:Node] = [:]
    var reverseTries:[Int:Node] = [:]
    
    for word in words {
        if tries[word.count] == nil {
            tries[word.count] = Node()
            reverseTries[word.count] = Node()
        }
        makeTrie(Array(word), tries[word.count]!)
        makeTrie(Array(word).reversed(), reverseTries[word.count]!)
    }

    var answer:[Int] = []
    for query in queries {
        var numOfWordsPerQuery:Int = 0
        if query.first == "?" {
            // reverse
            if let targetTrie = reverseTries[query.count] {
                numOfWordsPerQuery = getResultOfQuery(Array(query).reversed(), targetTrie)
            } else {
                numOfWordsPerQuery = 0
            }
        } else {
            if let targetTrie = tries[query.count] {
                numOfWordsPerQuery = getResultOfQuery(Array(query), targetTrie)
            } else {
                numOfWordsPerQuery = 0
            }
        }
        answer.append(numOfWordsPerQuery)
    }
    
    return answer
}

func makeTrie(_ word:[Character], _ root:Node) {
    var parent:Node = root
    for ch in Array(word) {
        if parent.childs[ch] == nil {
            let child:Node = Node()
            parent.childs[ch] = child
        }
        parent.cnt += 1
        parent = parent.childs[ch]!
    }
}

func getResultOfQuery(_ query:[Character], _ root:Node) -> Int {
    var parent:Node = root
    for q in query {
        if q == "?" {
            return parent.cnt
        } else {
            if parent.childs[q] == nil {
                return 0
            } else {
                parent = parent.childs[q]!
            }
        }
    }
    return parent.cnt
}

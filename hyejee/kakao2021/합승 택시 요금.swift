import Foundation

struct Heap<Element> {
    
    var elements: [Element] = []
    let orderCriteria: (Element, Element) -> Bool
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    
    init(orderCriteria: @escaping (Element, Element) -> Bool) {
        self.orderCriteria = orderCriteria
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    // O(log N)
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        
        elements.swapAt(0, count - 1)
        
        defer {
            shiftDown(from: 0)
        }
        
        return elements.removeLast()
    }
    
    mutating func insert(element: Element) {
        elements.append(element)
        shitfUp(from: count - 1)
    }
    
    // O(log N)
    mutating func shiftDown(from index: Int) {
        var parent: Int = index
        
        while true {
            let leftChildIndex: Int = self.leftChildIndex(ofParentAt: parent)
            let rightChildIndex: Int = self.rightChildIndex(ofParentAt: parent)
            var candidate: Int = parent
            
            if leftChildIndex < self.count && orderCriteria(elements[leftChildIndex], elements[candidate]) {
                candidate = leftChildIndex
            }
            
            if rightChildIndex < self.count && orderCriteria(elements[rightChildIndex], elements[candidate]) {
                candidate = rightChildIndex
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func shitfUp(from index: Int) {
        var childIndex: Int = index
        var parentIndex: Int = self.parentIndex(ofChildAt: childIndex)
        
        while childIndex > 0, !self.orderCriteria(elements[parentIndex], elements[childIndex]) {
            self.elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofChildAt: childIndex)
        }
    }
}

struct Edge {
    let to: Int
    let cost: Int
}

struct Info {
    let index: Int
    let cost: Int
}

var adjacentList: [[Edge]] = []

func dijkstra(start: Int, numberOfNodes: Int) -> [Int] {
    // costs[i]는 start에서 정점 i까지 가는데 필요한 최소 비용
    var costs: [Int] = Array(repeating: 100_000 * 19_900 + 5, count: numberOfNodes + 1)
    var minHeap: Heap<Info> = Heap {
        return $0.cost < $1.cost
    }
    
    // 시작지점에 대한 초기화
    costs[start] = 0
    minHeap.insert(element: Info(index: start, cost: 0))
    
    while !minHeap.isEmpty {
        guard let minInfo: Info = minHeap.remove() else {
            fatalError()
        }
        
        if minInfo.cost > costs[minInfo.index] {
            continue
        }
        
        for adjacent in adjacentList[minInfo.index] {
            let candidateCost: Int = minInfo.cost + adjacent.cost
            
            if candidateCost >= costs[adjacent.to] {
                continue
            }
            
            costs[adjacent.to] = candidateCost
            minHeap.insert(element: Info(index: adjacent.to, cost: candidateCost))
        }
    }
    
    return costs
}

func configureCostsArray(numberOfNodes: Int) -> [[Int]] {
    var costsArray: [[Int]] = Array(repeating: [], count: numberOfNodes + 1)
    
    for node in 1...numberOfNodes {
        costsArray[node] = dijkstra(start: node, numberOfNodes: numberOfNodes)
    }
    
    return costsArray
}

func configureAdjacentList(numberOfNodes: Int, fares: [[Int]]) {
    adjacentList = Array(repeating: [], count: numberOfNodes + 1)
    
    for fare in fares {
        let node1: Int = fare[0]
        let node2: Int = fare[1]
        let cost: Int = fare[2]
        
        adjacentList[node1].append(Edge(to: node2, cost: cost))
        adjacentList[node2].append(Edge(to: node1, cost: cost))
    }
}

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    configureAdjacentList(numberOfNodes: n, fares: fares)
    
    let costs: [[Int]] = configureCostsArray(numberOfNodes: n)
    var minCost: Int = costs[s][a] + costs[s][b]
    
    for candidateNode in 1...n {
        if candidateNode == s { continue }
        let candidateCost: Int = costs[s][candidateNode] + costs[candidateNode][a] + costs[candidateNode][b]
        minCost = min(minCost, candidateCost)
    }
    
    return minCost
}

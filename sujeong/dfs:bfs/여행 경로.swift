import Foundation


func solution(_ tickets:[[String]]) -> [String] {
    
    var adj:[String:[String]] = makeAdjList(tickets)
    adj = getSortedAdj(adj)
    
    return getPath(tickets.count, adj)
}

func makeAdjList(_ tickets:[[String]]) -> [String:[String]] {
    var adj:[String:[String]] = [:]
    
    for ticket in tickets {
        if adj[ticket[0]] == nil {
            adj[ticket[0]] = [ticket[1]]
        } else {
            adj[ticket[0]]!.append(ticket[1])
        }
    }
    
    return adj
}

func getSortedAdj(_ adj:[String:[String]]) -> [String:[String]] {
    var _adj = adj
    for city in _adj {
        _adj[city.key] = city.value.sorted()
    }
    return _adj
}

func getPath(_ numOfTickets:Int, _ adj:[String:[String]]) -> [String] {
    var queue:[(cnt:Int, current:String, adj:[String:[String]], path:[String])] = []
    
    queue.append((0,"ICN",adj,["ICN"]))
    
    while (!queue.isEmpty) {
        let here = queue.removeFirst()
        if here.cnt == numOfTickets {
            return here.path
        }
        
        for (idx,next) in (here.adj[here.current] ?? []).enumerated() {
            var _adj = here.adj
            _adj[here.current]!.remove(at:idx)
            queue.append((here.cnt+1, next, _adj, here.path+[next]))
        }
    }
    
    return []
}

//
//  main.swift
//  programmers-swift
//
//  Created by HyeeJee Kim on 2022/03/28.
//

import Foundation

class Ticket: Comparable {
    
    let destination: String
    var isUsed: Bool = false
    
    init(destination: String) {
        self.destination = destination
    }
    
    static func < (lhs: Ticket, rhs: Ticket) -> Bool {
        return lhs.destination < rhs.destination
    }
    
    static func == (lhs: Ticket, rhs: Ticket) -> Bool {
        return lhs.destination == rhs.destination
    }
    
}

var adjacentList: [String: [Ticket]] = [:]
var answer: [String] = []
var numberOfTickets: Int = 0

func dfs(ticket: Ticket) {
    ticket.isUsed = true
    answer.append(ticket.destination)
    
    print(ticket.destination)
    
    if var adjacentListOfAirport: [Ticket] = adjacentList[ticket.destination] {
        adjacentListOfAirport.sort()
        print(adjacentListOfAirport.map({ $0.destination }))
        for adjacent in adjacentListOfAirport {
            if adjacent.isUsed || adjacentList[adjacent.destination, default: []].isEmpty {
                continue
            }
            
            var flag: Bool = false

            for adjacentTicket in adjacentList[adjacent.destination, default: []] {
                if !adjacentTicket.isUsed {
                    flag = true
                    break
                }
            }
            
            if !flag, answer.count != numberOfTickets {
                continue
            }
            
            dfs(ticket: adjacent)
        }
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    for ticket in tickets {
        adjacentList[ticket[0], default: []].append(Ticket(destination: ticket[1]))
    }
    
    numberOfTickets = tickets.count
    
    dfs(ticket: Ticket(destination: "ICN"))
    
    return answer
}

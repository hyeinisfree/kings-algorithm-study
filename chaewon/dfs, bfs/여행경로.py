from collections import defaultdict


def solution(tickets):
    answer = []
    airline = defaultdict(list)

    for ticket in tickets:
        airline[ticket[0]].append(ticket[1])

    for key in airline.keys():
        airline[key].sort(reverse=True)

    stack = ['ICN']
    while stack:
        current = stack[-1]

        print(stack, airline[current], answer)
        if not airline[current]:
            answer.append(stack.pop())
        else:
            stack.append(airline[current].pop())
    answer.reverse()

    return answer
from collections import defaultdict

def solution(words, queries):
    answer = []
    
    match = defaultdict(int)
    for word in words:
        n = len(word)
        for i in range(1, n):
            f = '?'*i + word[i:]
            b = word[:-i] + '?'*i
            match[f] += 1
            match[b] += 1
        match['?'*n] += 1
    
    for query in queries:
        answer.append(match[query])
        
    return answer

print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["fro??", "????o", "fr???", "fro???", "pro?"]))
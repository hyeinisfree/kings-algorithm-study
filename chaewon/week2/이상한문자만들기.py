def solution(s):
    answer = []

    for voca in s.split(" "):
        word = ""
        for i in range(len(voca)):
            if i % 2:
                word += voca[i].lower()
            else:
                word += voca[i].upper()
        answer.append(word)
    return ' '.join(answer)
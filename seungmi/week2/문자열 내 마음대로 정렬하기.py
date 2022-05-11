def solution(strings, n):
    nth_letters=[]
    for word in strings:
        nth_letters.append((word[n],word))
    nth_letters=sorted(nth_letters)
    return [i[1] for i in nth_letters]
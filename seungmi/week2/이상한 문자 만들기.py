def solution(s):
    answer = ''
    s_array=s.split(" ")
    for word in s_array:
        for i,letter in enumerate(word):
            if i%2==0:
                answer+=letter.upper()
            else:
                answer+=letter.lower()
        answer+=" "
    return answer[:-1]
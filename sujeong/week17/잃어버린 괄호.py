//
//  잃어버린 괄호.cpp
//  kings-algorithm-project
//
//  Created by 임수정 on 2022/06/12.
//

form = input()
elements = form.split('-')

result = 0
cnt = 0
for e in elements:
    if cnt == 0 and '+' not in e:
        result += int(e)
        cnt = 1
        continue
    if '+' in e:
        plus_elements = e.split('+')
        sum = 0
        for pe in plus_elements:
            sum += int(pe)
        if cnt == 0:
            result += sum
            cnt = 1
        else : result -= sum
    else :
        result -= int(e)
    

print(result)

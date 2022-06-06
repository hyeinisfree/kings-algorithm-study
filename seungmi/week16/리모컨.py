
#미해결 

import sys
# from collections import deque
channel=input()
button=['0','1','2','3','4','5','6','7','8','9']
m=int(input())

#고장난 버튼 없음
if m==0:
  print(len(channel))
  sys.exit()

broken_set=set(input().split())
button=list(set(button)-broken_set)
now='100'

if channel==now:
  print(0)
  sys.exit()

# 모든 숫자 버튼이 다 고장남 
if not button:
  print(abs(int(channel)-int(now)))
  sys.exit()

press_num=[]

for c in list(channel):
  if c in button:
    press_num.append(c)
  else:
    min_diff=10
    replace_button=c
    for b in button:
      if min_diff>abs(int(c)-int(b)):
        replace_button=b
        min_diff=abs(int(c)-int(b))
    press_num.append(replace_button)
    break

if len(channel)>len(press_num):
  index=len(press_num)-1
  if int(press_num[index])>int(channel[index]):
    add_num=str(min(map(int,button)))
  else:
    add_num=str(max(map(int,button)))
    
  while len(channel)>len(press_num):
    press_num.append(add_num)

tmp=int(''.join(press_num))


print(min(abs(tmp-int(channel))+len(channel) ,abs(int(channel)-int(now))))












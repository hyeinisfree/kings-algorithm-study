from curses.ascii import isdigit
import sys


n,m=map(int,sys.stdin.readline().split())
pokemon={}

for i in range(1,n+1):
  name=sys.stdin.readline().rstrip()
  pokemon[name]=i
  pokemon[i]=name


for _ in range(0, m):
  quiz=sys.stdin.readline().rstrip()
  if quiz.isdigit():
    quiz=int(quiz)
  print(pokemon[quiz])



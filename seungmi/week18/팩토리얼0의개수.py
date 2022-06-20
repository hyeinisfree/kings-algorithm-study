import sys 



n=int(sys.stdin.readline().rstrip())
fac=1
count_2=0
count_5=0
for i in range(1,n+1):
    while i%2==0 or i%5==0:
        if i%2==0:
            count_2+=1
            i=i//2
        if i%5==0:
            count_5+=1
            i=i//5

print(min(count_2,count_5))



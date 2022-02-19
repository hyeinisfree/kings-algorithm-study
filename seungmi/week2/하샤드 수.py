def harshad(n):
  return n % sum([int(c) for c in str(n)]) == 0
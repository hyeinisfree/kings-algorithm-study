def solution(N, number):
    if N == number:
        return 1

    dp = [0, [N]]
    for i in range(2, 9):
        all_case = set()
        basic_number = int(str(N) * i)
        all_case.add(basic_number)
        for j in range(1, i // 2 + 1):
            for x in dp[j]:
                for y in dp[i - j]:
                    all_case.add(x + y)
                    all_case.add(x - y)
                    all_case.add(y - x)
                    all_case.add(x * y)
                    if y != 0:
                        all_case.add(x // y)
                    if x != 0:
                        all_case.add(y // x)
        if number in all_case:
            return i
        dp.append(all_case)
    return -1
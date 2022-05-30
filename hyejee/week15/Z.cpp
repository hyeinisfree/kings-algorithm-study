#include <iostream>

using namespace std;

int solution(int n, int r, int c) {
    if (n == 0) return 0;
    
    int half = 1 << (n - 1);
    
    if (r < half && c < half) return solution(n - 1, r, c);
    if (r < half && c >= half) return half * half + solution(n - 1, r, c - half);
    if (r >= half && c < half) return 2 * half * half + solution(n - 1, r - half, c);
    return 3 * half * half + solution(n - 1, r - half, c - half);
}

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);
    
    int N, r, c;
    cin >> N >> r >> c;
    
    cout << solution(N, r, c) << '\n';
    
    return 0;
}

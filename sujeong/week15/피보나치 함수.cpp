#include <iostream>
using namespace std;
int fibo[40][2];
int main(){
    fibo[0][0] = 1;
    fibo[0][1] = 0;
    fibo[1][0] = 0;
    fibo[1][1] = 1;
    int c,n;
    cin >> c;
    for(int i = 0 ; i < c ; i++){
        cin >> n;
        if(n <= 1){
            cout << fibo[n][0] << " "<<fibo[n][1] << "\n";
            continue;
        }
        for(int i = 2 ; i <= n; i++){
            fibo[i][0] = fibo[i-1][0] + fibo[i-2][0];
            fibo[i][1] = fibo[i-1][1] + fibo[i-2][1];
        }
        cout << fibo[n][0] << " " << fibo[n][1] << "\n";
    }
    return 0;
}

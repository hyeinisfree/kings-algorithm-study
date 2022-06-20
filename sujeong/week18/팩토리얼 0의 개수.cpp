#include <iostream>
using namespace std;
int main(){
    int n,k;
    cin >> n;
    int cnt = 0;
    for(int i = n ; i > 0 ; i--){
        k = i;
        while(k%5 == 0){
            cnt++;
            k = k/5;
        }
    }
    cout << cnt;
    return 0;
}

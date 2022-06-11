//
//  1로 만들기.cpp
//  kings-algorithm-project
//
//  Created by 임수정 on 2022/06/12.
//

#include <iostream>
using namespace std;

int main(){
    int n;
    cin >> n;
    int results[n+1];
    results[1] = 0;
    results[2] = 1;
    results[3] = 1;
    for(int i = 4; i <= n; i++){
        results[i] = results[i-1]+1;
        if(i % 3 == 0){
            results[i] = min(results[i], results[i/3]+1);
        }
        if(i % 2 == 0){
            results[i] = min(results[i], results[i/2]+1);
        }
    }
    cout << results[n];
    return 0;
}

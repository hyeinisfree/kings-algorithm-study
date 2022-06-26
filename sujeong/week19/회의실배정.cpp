#include <iostream>
#include <algorithm>
using namespace std;

int main(){
    int n;
    cin >> n;
    
    pair<int, int> time[n];
    int end, start;
    for(int i = 0 ; i < n ; i++){
        cin >> start >> end;
        time[i] = make_pair(end, start);
    }
    //끝나는 시간 기준으로 정렬 됨
    sort(time, time+n);
    
    int cnt = 1;
    int endtime = time[0].first;
    for(int i = 1 ; i < n ; i++){
        if(time[i].second >= endtime){
            cnt++;
            endtime = time[i].first;
        }
    }
    cout << cnt;
    
    return 0;
}

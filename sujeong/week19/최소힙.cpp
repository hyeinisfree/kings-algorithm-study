#include <iostream>
#include <queue>
#include <vector>
using namespace std;

struct cmp{
    bool operator()(int a, int b){
        return a > b;
    }
};


int main(){
    
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    
    priority_queue<int, vector<int>, cmp> heap;

    int t;
    cin >> t;
    
    int x;
    for(int i = 0 ; i < t ; i++){
        cin >> x;
        if(x == 0){
            if(heap.empty()){
                cout << "0\n";
            }else{
                cout << heap.top() << "\n";
                heap.pop();
            }
        }else{
            heap.push(x);
        }
    }
    
}
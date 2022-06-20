#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;
vector<string> hearSee;
vector<string> hear;
int H, S;
void binarySearch(string see){
    int s = 0;
    int e = H-1;
    int mid;
    while(s <= e){
        mid = (s+e)/2;
        if(hear[mid].compare(see) == 0){
            hearSee.push_back(see);
            return;
        }else if(hear[mid].compare(see) > 0){
            e = mid-1;
        }else{
            s = mid+1;
        }
    }
    return;
}
int main(){
    cin >> H >> S;
    string hearname;
    for(int i = 0 ; i < H ; i++){
        cin >> hearname;
        hear.push_back(hearname);
    }
    sort(hear.begin(), hear.end());
    string see;
    for(int i = 0 ; i < S ; i++){
        cin >> see;
        binarySearch(see);
    }
    sort(hearSee.begin(), hearSee.end());
    cout << hearSee.size() << "\n";
    for(int i = 0 ; i < hearSee.size() ; i++){
        cout << hearSee[i] << "\n";
    }
    return 0;
}

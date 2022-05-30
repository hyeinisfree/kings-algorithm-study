#include <iostream>
#include <vector>
using namespace std;

int main(void) {
    int frequencyOfZero[41] = {1, 0};
    int frequencyOfOne[41] = {0, 1};
    
    for (int i = 2; i < 41; i++) {
        frequencyOfZero[i] = frequencyOfZero[i - 1] + frequencyOfZero[i - 2];
        frequencyOfOne[i] = frequencyOfOne[i - 1] + frequencyOfOne[i -2];
    }
    
    int numberOfTestCase;
    
    cin >> numberOfTestCase;
    
    vector<int> testCases;
    int testCase;
    
    for (int i = 0; i < numberOfTestCase; i++) {
        cin >> testCase;
        
        testCases.push_back(testCase);
    }
    
    for (int i = 0; i < numberOfTestCase; i++) {
        cout << frequencyOfZero[testCases[i]] << " " << frequencyOfOne[testCases[i]] << endl;
    }
    
    return 0;
}

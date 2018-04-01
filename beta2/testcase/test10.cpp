#include<bits/stdc++.h>
using namespace std;
const int mo=233;

bool check(int x){
    set<int>S;
    int e=1;
    for(int i=0;i+1<mo;i++){
        e=e*x%mo;
        S.insert(e);
    }
    return S.size()==mo-1;
}

int main(){
    for(int i=1;;i++){
        if(check(i)){
            cout<<i<<endl;
            return 0;
        }
    }
    return 0;
}

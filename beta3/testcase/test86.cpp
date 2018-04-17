#include<iostream>
using namespace std;
int f(int x,int y){
   int c=x+y;
   return c;
}

int main(){
    int x=3;
    x++;
    int i=0;
    int y=0;
    for(i=0;i<5;i++){
        x=x+y;
        y=i+1;
        cout<<i<<endl;
        cout<<x<<endl;
        cout<<y<<endl;
        cout<<f(x,y)<<endl;
    }
    return 0;
}

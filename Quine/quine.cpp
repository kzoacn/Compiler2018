#include<cstdio>
#include<string>
using namespace std;

void println(string s){
    cout<<s<<endl;
}

int main(){
    string q="\"";
    string b="\\";
    string s="int main(){string que="+q+b+q+q+";string b="+q+b+b+q+";string s=";
    println(s+q+s+q);
}

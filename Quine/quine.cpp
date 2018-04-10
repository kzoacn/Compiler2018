#include<iostream>
#include<string>
using namespace std;


void println(string s){
    cout<<s<<endl;
}

string q="\"",b="\\";
void quine(string s){println("string q="+q+b+q+q+",b="+q+b+b+q+";"+s+"int main(){quine("+q+s+q+");}");}
int main(){quine("void quine(string s){println("+q+"string q="+q+"+q+b+q+q+"+q+",b="+q+"+q+b+b+q+"+q+";"+q+"+s+"+q+"int main(){quine("+q+"+q+s+q+"+q+");}"+q+");}");}

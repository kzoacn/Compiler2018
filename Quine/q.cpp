#include<iostream>
using namespace std;
void println(string s){
    cout<<s<<endl;
}

string di(int x){
if(x==0)return "0";
if(x==1)return "1";
if(x==2)return "2";
if(x==3)return "3";
if(x==4)return "4";
if(x==5)return "5";
if(x==6)return "6";
if(x==7)return "7";
if(x==8)return "8";
if(x==9)return "9";
}
string s2(int x){
if(x<=9)return "s["+di(x)+"]=";
return "s["+di(x/10)+di(x%10)+"]=";
}
string c2(int x){
if(x<=9)return "c["+di(x)+"]=";
return "c["+di(x/10)+di(x%10)+"]=";
}
string co=";";
string a2q="\"";
string a2b="\\";
string s[20];string c[20];int main(){int i=0;
c[0]="string co=";
c[1]="string a2q=";
c[2]="string a2b=";
s[0]="string s[20];string c[20];int main(){int i=0;";
s[1]="println(c[0]+a2q+co+a2q+co);";
s[2]="println(c[1]+a2q+a2b+a2q+a2q+co);";
s[3]="println(c[2]+a2q+a2b+a2b+a2q+co);";
s[4]="println(s[0]);";
s[5]="for(i=0;i<=8;i++)println(n2(i)+a2q+s[i]+a2q+co);";
s[6]="for(i=0;i<=2;i++)println(c2(i)+a2q+c[i]+a2q+co);";
s[7]="for(i=1;i<=8;i++)println(s[i]);";
s[8]="}";
println(c[0]+a2q+co+a2q+co);
println(c[1]+a2q+a2b+a2q+a2q+co);
println(c[2]+a2q+a2b+a2b+a2q+co);
println(s[0]);
for(i=0;i<=2;i++)println(c2(i)+a2q+c[i]+a2q+co);
for(i=0;i<=8;i++)println(s2(i)+a2q+s[i]+a2q+co);
for(i=1;i<=8;i++)println(s[i]);
}

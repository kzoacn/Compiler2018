#include<bits/stdc++.h>
using namespace std;

void head(){
    cout<<"#include<iostream>"<<endl;
    cout<<"using namespace std;"<<endl;
    cout<<"void println(string s){"<<endl;
    cout<<"    cout<<s<<endl;"<<endl;
    cout<<"}"<<endl;
}
vector<string>s,c;
void modifySlast3(){
    int size=s.size()+6;
    s.push_back("println(s[0]);");
    s.push_back("for(i=0;i<"+to_string(c.size())+";i++)println(c2(i)+a2q+c[i]+a2q+co);");
    s.push_back("for(i=0;i<"+to_string(size)+";i++)println(s2(i)+a2q+s[i]+a2q+co);");
    s.push_back("for(i=1;i<"+to_string(size)+";i++)println(s[i]);");
    s.push_back("return 0;");
    s.push_back("}");
}

map<char,int>C;

string sym(char c){
    if(c=='\\')return "a2b";
    if(c=='\"')return "a2q";
    return "c["+to_string(C[c])+"]";
}

string trans(string s){
    string ans;
    ans=sym(s[0]);
    for(int i=1;i<s.length();i++)
        ans=ans+("+")+sym(s[i]);
    return ans;
}

vector<string>vec;

int main(){
    vec.push_back("string digt(int x){");
    vec.push_back("if(x==0)return \"0\";");
    vec.push_back("if(x==1)return \"1\";");
    vec.push_back("if(x==2)return \"2\";");
    vec.push_back("if(x==3)return \"3\";");
    vec.push_back("if(x==4)return \"4\";");
    vec.push_back("if(x==5)return \"5\";");
    vec.push_back("if(x==6)return \"6\";");
    vec.push_back("if(x==7)return \"7\";");
    vec.push_back("if(x==8)return \"8\";");
    vec.push_back("if(x==9)return \"9\";");
    vec.push_back("}");
    
    vec.push_back("string[] s=new string[256];");
    vec.push_back("string[] c=new string[256];");
  
//    vec.push_back("string s[256];");
//    vec.push_back("string c[256];");  
    vec.push_back("string s2(int ss){");
    vec.push_back("if(ss<=9)return \"s[\"+digt(ss)+\"]=\";");
    vec.push_back("return \"s[\"+digt(ss/10)+digt(ss%10)+\"]=\";");
    vec.push_back("}");
    
    vec.push_back("string c2(int cc){");
    vec.push_back("if(cc<=9)return \"c[\"+digt(cc)+\"]=\";");
    vec.push_back("return \"c[\"+digt(cc/10)+digt(cc%10)+\"]=\";");
    vec.push_back("}");
    
    vec.push_back("string co=\";\";");
    vec.push_back("string a2q=\"\\\"\";");
    vec.push_back("string a2b=\"\\\\\";");

    head();
    int cur=0;
    for(int i=32;i<=126;i++){
        if(i=='\\')continue;
        if(i=='\"')continue;
        C[(char)i]=cur++;
        c.push_back(string(1,(char)i));
    }
    for(auto str:vec)
        cout<<str<<endl;
    s.push_back("int main(){int i=0;// Quine is a a program that produces its source code as output.");
    cout<<s[0]<<endl;
    for(int i=0;i<c.size();i++)
        printf("c[%d]=\"%s\";\n",i,c[i].c_str());
    
    for(auto str:vec)
        s.push_back("println("+trans(str)+");");
    
    modifySlast3();
    for(int i=0;i<s.size();i++)
        printf("s[%d]=\"%s\";\n",i,s[i].c_str());
    for(int i=1;i<s.size();i++)
        printf("%s\n",s[i].c_str());
    return 0;
}

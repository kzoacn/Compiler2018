#include<iostream>
using namespace std;
int main(){
    string s;
    while(getline(cin,s)){
        cout<<"printf(\""<<s<<"\\n\");" <<endl;
    }
}

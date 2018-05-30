#include<bits/stdc++.h>
using namespace std;
int main(){
	string s;
	cout<<"#include<stdio.h>"<<endl;
	cout<<"int main(){"<<endl;
	
	string ans;
	
	while(1){
		int x=cin.get();
		if(x==EOF)break;
		if(x==10)ans+="\\",ans+="n";
		else if(x=='\\')ans+="\\\\";
		else if(x=='"')ans+="\\\"";
		else ans+=string(1,char(x));
	}
	
	
	
		cout<<"printf(\""<<ans<<"\");"<<endl;
	cout<<"}"<<endl;
	
	return 0;
}

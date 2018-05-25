#include<iostream>
#include<algorithm>
#include<cctype>
#include<vector>
using namespace std;
vector<string>split(string s){
	vector<string>vec;
	string tmp;
	for(auto c:s){
		if(c==','||isblank(c)){
			if(tmp!="")
				vec.push_back(tmp);
			tmp="";
		}else tmp+=c;
	}
	if(tmp!="")vec.push_back(tmp);
	return vec;
}
int main(){
	string s;
	while(getline(cin,s)){
		auto vec=split(s);
		int flag=1;
		if(vec.size()==3){
			if(vec[0]=="mov" && vec[1]==vec[2]){
				flag=0;
			}
		}
		if(flag)cout<<s<<endl;
	}
	return 0;
}


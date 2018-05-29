#include<bits/stdc++.h>
using namespace std;
int main(){
	int t=30;
	puts("int x0=1;");
	for(int i=1;i<=t;i++){
		int x=rand()%i,y=rand()%i;
		printf("int x%d=x%d+x%d;\n",i,x,y);
	}
	for(int i=1;i<=t;i++){
		printf("cout<<x%d<<endl;\n",i);
	}
	
	return 0;
}

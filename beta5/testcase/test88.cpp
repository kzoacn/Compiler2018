#include<iostream>
using namespace std;
int A = 1;
int B = 1;
int C = 1;

int main(){
    C = (A + B) + (C - A + B) - (A + B) + ((C - A + B) - (A + B)) + (C - A + B);
	cout<<A<<" "<<B<<" "<<C<<endl;
	return 0;
}


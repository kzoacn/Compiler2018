#include<stdio.h>

int main(){
	char s[1<<19];
	FILE *fin=fopen("ans.out","r");
	while(fgets(s,1<<16,fin))
		printf(s);
	
	fclose(fin);
}

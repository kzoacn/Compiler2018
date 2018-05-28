long f(long x){
	long y=0;
	puts("f");
	return y;
}
long g(long x){
	long y=0,z=1;
	puts("g");
	return f(y);
}
long h(long x){
	long y=0,z=0,m=0;
	puts("h");
	return f(y);
}
long i(long x){
	long y=0,z=1,u=0,t=0;
	puts("i");
	return g(y);
}
int main(){
	i(0);
    return 0;
}

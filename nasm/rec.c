int h(int n);
int N=0;
int f(int n){
    if(n<=0)return 0;
    N++;
    return g(n-1);
}

int g(int n){
    if(n<=0)return 0;
        N++;
    return h(n-1);
}
int h(int n){
    if(n<=0)return 0;
        N++;
    return h(n-1);
}
int main(){
    
}

struct pair{
    int first;
    int second;
};

struct pair* func(int n){
    struct pair pr=;
    pr.first=n*n;
    pr.second=n+1;
    return pr;
}

int main(){
    int n=4;
    struct pair pr=func(n);
    return 0;
}

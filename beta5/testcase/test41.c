
int dfs(int n){
    int ans=0;
    int i=1;
    while(1){
        i++;
        ans=ans+i;
        if(i==n)
            return ans;
        dfs(n-1);
    }
    return 0;
}

int main(){
    printf("%d\n",dfs(5));
}

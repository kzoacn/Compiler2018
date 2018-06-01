
int n=50;
int mem[51][51];

int max(int x,int y){
    if(x>y)return x;
    return y;
}
int seed=13;
int rnd(){
    seed=(seed*7+4)%233;
    return seed+1;
}
int a[333];


int dp(int l,int r){
   // printf("%d %d\n",l,r);
   if(l>r)return 0;
   if(l==r)
        return a[l];
   if(mem[l][r]!=0)
        return mem[l][r];
   int ans=0;
   for(int i=l;i<r;i++){
        ans=max(ans,dp(l,i)+dp(i+2,r));
   }
   
   mem[l][r]=ans;
   return ans;
}

int main(){
    int i;
    for(i=1;i<=n;i++)
        a[i]=rnd();
    
    printf("%d\n",dp(1,n));
    //println(toString(dp(1,n)));

    return 0;
}

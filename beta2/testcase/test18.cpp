#include<bits/stdc++.h>
using namespace std;
int main(){
    int n=4,m=3,l=6;
    static int dp[7][7][7];

    dp[0][0][0]=1;
    for(int i=0;i<=n;i++)
    for(int j=0;j<=m;j++)
    for(int k=0;k<=l;k++){
        if(i==0 || j==0 ||k==0)
            dp[i][j][k]=1;
        else{
            dp[i][j][k]=dp[i-1][j][k]+dp[i][j-1][k]+dp[i][j][k-1];
        }
    }
    cout<<dp[n][m][l]<<endl;

    return 0;
}

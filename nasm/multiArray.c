
long* address(long *st,long pos){
    return st+1+pos;
}

//#define address(st,pos) (st)+((pos)*8+8)

long* mallocArray(long size){
    long* s=malloc(size*8+8);
    *s=size;
    return s;
}


long* _multiArray(int n,long* a){
    if(n+1==*a)
        return mallocArray(*address(a,n));
    long size=*address(a,n);
    long* arr=mallocArray(size);
    int i;
    for(i=0;i<size;i++){
        *address(arr,i) = _multiArray(n+1,a);
    }
    return arr;
}

long* multiArray(long* a){
    return _multiArray(0,a);
}


void test(){
    long* a=mallocArray(2);
    *address(a,0)=4;
    *address(a,1)=5;
    long* arr=multiArray(a);
    
    long i,j;
    long cnt=0;
    for(i=0;i<4;i++){
        long* arr0=*address(arr,i);
        for(j=0;j<5;j++){
            *address(arr0,j) = ++cnt;
        }
    }
        
    
    for(i=0;i<4;i++){
        long* arr0=*address(arr,i);
        for(j=0;j<5;j++){
            printf("%d%c",*address(arr0,j)," \n"[j==4]);
        }
    }
          

}
int main(){

    long n=5;
    
    long* arr=mallocArray(1);
    *address(arr,0)=n;

    long* a=multiArray(arr);
    *address(a,0)=1;
    *address(a,1)=5;
    *address(a,2)=2;
    *address(a,3)=4;
    *address(a,4)=3;
    int i;
    for(i=0;i<n;i++){
        printf("%ld\n",*address(a,i));   
    }
}

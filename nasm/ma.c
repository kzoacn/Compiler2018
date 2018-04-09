
long* mallocArray(long size){
    long* s=malloc((size+1)<<4);
    *s=size;
    return s;
}

char* concat(char *s1,char *s2){
    char *s=malloc(*s1 + *s2 +2 );
    *s=*s1 + *s2;
    long i=0,j=0;
    for(i=0;i< *s1 ;i++)
        s[++j]=s1[i+1];
    for(i=0;i< *s2 ;i++)
        s[++j]=s2[i+1];
    s[++j]=0;    
    return s;
}


long* address(long st,long pos){
    return (void*)(st+((pos+1)<<4));
}


long* multiAddress(char* st,long* a){
    long size=*a,i;
    char *cur=st;
    for(i=1;i<size;i++){
        cur=*address((long)cur,*address(a,i-1));
    }
    cur=address((long)cur,*address(a,size-1));
    return cur;
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

char* toString(long x){


    long len=0,flag=1;
    if(x==0)
        len=1;
    if(x<0){
        x=-x;
        flag=-1;
        len++;
    }
    long y=x;
    while(y>0){
        len++;
        y/=10;
    }
    char *s=malloc(len+2);
    *(s+len+1)=0;
    char *c=s;
    *c=(char)len&255;
    c++;
    
    if(flag==-1){
        *c='-';
    }
    c=s+len;
    if(x==0)
        *c='0';
   
    while(x>0){
        *c=(char)(x%10+'0');
        c--;
        x/=10;
    }
    return s;
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
    long* id=mallocArray(2);
    *address(id,0)=3;
    *address(id,1)=4;
    
    long* mul=multiArray(id);
    
    long i,j;
    for(i=0;i<3;i++){
        for(j=0;j<4;j++){
            *address(id,0)=i;
            *address(id,1)=j;
            *multiAddress(mul,id)=i+j;
    
        }
    }
    for(i=0;i<3;i++){
        for(j=0;j<4;j++){
            *address(id,0)=i;
            *address(id,1)=j;
    
            printf("%d\n",*multiAddress(mul,id));
        }
    }
}

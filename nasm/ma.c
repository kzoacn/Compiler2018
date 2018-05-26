
long* mallocArray(long size){
    long* s=malloc((size+1)<<3);
    memset(s,0,(size+1)<<3);
    *s=size;
    return s;
}

unsigned char* concat(unsigned char *s1,unsigned char *s2){
    unsigned char *s=malloc((unsigned char)*s1 + (unsigned char)*s2 +2 );
    *s=(unsigned char)*s1 + (unsigned char)*s2;
    long i=0,j=0;
    for(i=0;i< *s1 ;i++)
        s[++j]=s1[i+1];
    for(i=0;i< *s2 ;i++)
        s[++j]=s2[i+1];
    s[++j]=0;    
    return s;
}


long* address(long st,long pos){
    return (void*)(st+((pos+1)<<3));
}

#define addr(st,pos) ((long*)((st)+(((pos)+1)<<3)))


long* multiAddress(long* st,long* a){
	long size=*a,i;
	long *cur=st;
	if(size==0)return st;
	for(i=1;i<size;i++)
		cur=*address(cur,*address(a,i-1));
	cur=address(cur,*address(a,size-1));
	
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

unsigned char* toString(long x){


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
    unsigned char *s=malloc(len+2);
    *(s+len+1)=0;
    unsigned char *c=s;
    *c=(unsigned char)len&255;
    c++;
    
    if(flag==-1){
        *c='-';
    }
    c=s+len;
    if(x==0)
        *c='0';
   
    while(x>0){
        *c=(unsigned char)(x%10+'0');
        c--;
        x/=10;
    }
    return s;
}

long getInt(){
    long x;
    scanf("%ld",&x);
    return x;
}
char* getString(){
    static char buff[256];
    scanf("%s",buff);
    long len=strlen(buff),i;
    char *s=malloc(len+2);
    *s=len;
    for(i=1;i<=len;i++)
        *(s+i)=buff[i-1];
    *(s+len+1)=0;
    return s;
}


char* substring(long left,long right){
    unsigned char *sthis=(unsigned char*)0xffffff;
    char *t=malloc(right-left+1+2);
    *t=right-left+1;
    long i,j=0;
    for(i=left;i<=right;i++)
        t[++j]=sthis[i+1];
    t[++j]=0;
    return t;
}
long parseInt(){
    unsigned char *sthis=(unsigned char*)0xffffff;
    long i,x=0;
    for(i=1;i<=*sthis;i++){
        if('0'<=sthis[i]&&sthis[i]<='9'){
            x=x*10+(sthis[i]-'0');
        }else  
            return x;
    }
    return x;
}
long ord(long x){
    unsigned char *sthis=(unsigned char*)0xffffff;
    return (long)*(sthis+1+x);
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

long strls(char *a,char *b){return strcmp(a+1,b+1)<0;}
long strle(char *a,char *b){return strcmp(a+1,b+1)<=0;}
long streq(char *a,char *b){return strcmp(a+1,b+1)==0;}
long strge(char *a,char *b){return strcmp(a+1,b+1)>=0;}
long strgt(char *a,char *b){return strcmp(a+1,b+1)>0;}
long strne(char *a,char *b){return strcmp(a+1,b+1)!=0;}

int main(){
    unsigned char *one=toString(1);
    unsigned char *zero=toString(0);
    
    printf("%ld\n",strne(one,zero));
    
    int len=126;
    unsigned char *s1=toString(0),*s2=toString(0);
    int i=0;
    for(i=0;i<len;i++){
        s1=concat(s1,one);
        s2=concat(s2,zero);
    }
    puts(s1+1);
    puts(s2+1);
    puts(concat(s1,s2)+1);
}

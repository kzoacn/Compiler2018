
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


main(){

    char* s=toString(-987654);
    
    
    printf("%d\n",*s);
    printf("%c\n",*(s+1));
    printf("%c\n",*(s+2));
    printf("%c\n",*(s+3));
    printf("%c\n",*(s+4));
    printf("%c\n",*(s+5));
    printf("%c\n",*(s+6));
    printf("%c\n",*(s+7));
    printf("%d\n",*(s+8));
    return 0;
}



import java.io.*;
import java.util.*;
public class test47{

static class A{
    int[] a;
}

static class B{
    A[] b;
}

static void main2(){
    int n=5;
    B[] barray = new B[n];
    int i;
    for(i=0;i<n;i++){
        barray[i]=new B();
        barray[i].b=new A[n];
        int j;
        for(j=0;j<n;j++){
            barray[i].b[j]=new A();
            barray[i].b[j].a=new int[n];
            int k;
            for(k=0;k<n;k++){
                barray[i].b[j].a[k]=(i^j^k);    
            }
        }
    }
    System.out.println(barray[3].b[1].a[4]);
}

public static void main(String[] arg){
    main2();
}

}

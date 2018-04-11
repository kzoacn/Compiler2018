package cn.kzoacn;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;
import java.util.Scanner;

class SemanticTest {

    @Test
    void test0()throws Exception{
        testError("arrop-1-5100379071-puyouer");
    }

    @Test
    void test1()throws Exception{
        testError("asiop-1-5100379071-puyouer");
    }
    @Test
    void test2()throws Exception{
        testError("asiop-2-5100379071-puyouer");
    }
    @Test
    void test3()throws Exception{
        testError("asiop-3-5120309049-liaochao");
    }
    @Test
    void test4()throws Exception{
        testError("asiop-4-5120309049-liaochao");
    }
    @Test
    void test5()throws Exception{
        testError("asiop-5-5100379071-puyouer");
    }
    @Test
    void test6()throws Exception{
        testError("asiop-6-5100379071-puyouer");
    }
    @Test
    void test7()throws Exception{
        testError("asiop-7-5120309049-liaochao");
    }
    @Test
    void test8()throws Exception{
        testError("biop-1-5100379071-puyouer");
    }
    @Test
    void test9()throws Exception{
        testError("asiop-4-5120309049-liaochao");
    }

    void testError(String name) throws Exception{

        Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File("./semantic/error/" + name+".mx"));

        boolean result=Semantic.semantic(fileInputStream);
        //System.out.println(result);
        Assertions.assertTrue(!result);

    }
}

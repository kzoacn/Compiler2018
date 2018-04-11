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
    void testTo10()throws Exception{
        testError("arrop-1-5100379071-puyouer");
        testError("asiop-1-5100379071-puyouer");
        testError("asiop-2-5100379071-puyouer");
        testError("asiop-3-5120309049-liaochao");
        testError("asiop-4-5120309049-liaochao");
        testError("asiop-5-5100379071-puyouer");
        testError("asiop-6-5100379071-puyouer");
        testError("asiop-7-5120309049-liaochao");
        testError("biop-1-5100379071-puyouer");
        testError("asiop-4-5120309049-liaochao");
        testError("biop-1-5100379071-puyouer");
    }
    @Test
    void test11()throws Exception{
        testError("bitop-1-5120309049-liaochao");
    }
    @Test
    void test13()throws Exception{
        testError("boop-1-5120309049-liaochao");
    }
    @Test
    void test14()throws Exception{
        testError("class-1-5100379071-puyouer");
    }
    @Test
    void test15()throws Exception{
        testError("class-2-5120309049-liaochao");
    }
    @Test
    void test16()throws Exception{
        testError("class-5-515030910117-zhenglianmin");
    }
    @Test
    void test17()throws Exception{
        testError("class-6-515030910117-zhenglianmin");
    }
    @Test
    void test18()throws Exception{
        testError("class-7-515030910117-zhenglianmin.");
    }
    @Test
    void test19()throws Exception{
        testError("constructor-chenxinhao");
    }
    @Test
    void test20()throws Exception{
        testError("creator-515030910117-zhenglianmin.");
    }

    void testError(String name) throws Exception{

        Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File("./semantic/error/" + name+".mx"));

        boolean result=Semantic.semantic(fileInputStream);
        //System.out.println(result);
        Assertions.assertTrue(!result);

    }
}

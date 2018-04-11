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
    void testTo44()throws Exception{
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
        testError("bitop-1-5120309049-liaochao");
        testError("boop-1-5120309049-liaochao");
        testError("class-1-5100379071-puyouer");
        testError("class-2-5120309049-liaochao");
        testError("class-5-515030910117-zhenglianmin");
        testError("class-6-515030910117-zhenglianmin");
        testError("class-7-515030910117-zhenglianmin.");
        testError("constructor-chenxinhao");
        testError("creator-515030910117-zhenglianmin.");
        testError("ctrflow-1-5100379071-puyouer");
        testError("ctrflow-2-5120309049-liaochao");
        testError("ctrflow-3-5100379071-puyouer");
        testError("ctrflow-4-5120309049-liaochao");
        testError("ctrflow-5-5120309049-liaochao");
        testError("fldop-1-5120309049-liaochao");
        testError("func-1-5100379071-puyouer");
        testError("func-2-5120309049-liaochao");
        testError("func-3-5100379071-puyouer");
        testError("func-4-5100379071-puyouer");
        testError("func-5-5100309127-hetianxing");
        testError("func-6-5130309059-lijiajun");
        testError("func-7-5140309552-wancheng");
        testError("incop-1-5120309049-liaochao");
        testError("relop-1-5120309049-liaochao");
        testError("relop-2-5120309049-liaochao");
        testError("scope-1-5140519064-youyurong");
        testError("scope-1-515030910117-zhenglianmin");
        testError("scope-2-5140519064-youyurong");
        testError("selfref-5090379042-jiaxiao");
        testError("var-1-5110379024-wuhang");
        testError("var-2-5100309127-hetianxing");
        testError("var-3-5120309049-liaochao");
        testError("var-4-5140309552-wancheng");
    }
    @Test
    void test0()throws Exception{
        testPass("basicopt1-5100309127-hetianxing");
    }
    @Test
    void test1()throws Exception{
        testPass("basic_test-yurongyou");
    }
    @Test
    void test2()throws Exception{
        testPass("blank-515030910117-zhenglianmin");
    }
    @Test
    void test3()throws Exception{

    }
    @Test
    void test4()throws Exception{
        testPass("bulgarian-5110379024-wuhang");
    }
    @Test
    void test5()throws Exception{
        testPass("class-1-515030910117-zhenglianmin.");
    }
    @Test
    void test6()throws Exception{
        testPass("class-2-515030910117-zhenglianmin.");
    }
    @Test
    void test7()throws Exception{
        testPass("expr-5110309085-jintianxing");
    }
    @Test
    void test8()throws Exception{
        testPass("hanoi-5100379110-daibo");
    }
    @Test
    void test9()throws Exception{
        testPass("hashmap-5100309127-hetianxing");
    }
    @Test
    void test10()throws Exception{
        testPass("heapsort-5100379110-daibo");
    }

    void testError(String name) throws Exception{

        Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File("./semantic/error/" + name+".mx"));

        boolean result=Semantic.semantic(fileInputStream);
        //System.out.println(result);
        Assertions.assertTrue(!result);

    }
    void testPass(String name) throws Exception{

        Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File("./semantic/pass/" + name+".mx"));

        boolean result=Semantic.semantic(fileInputStream);
        //System.out.println(result);
        Assertions.assertTrue(result);

    }
}

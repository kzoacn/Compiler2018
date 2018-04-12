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
        /*testError("arrop-1-5100379071-puyouer");
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
        testError("class-6-515030910117-zhenglianmin");*/
        testError("class-7-515030910117-zhenglianmin.");
        /*testError("constructor-chenxinhao");
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
        testError("var-4-5140309552-wancheng");*/
    }
    @Test
    void testEasy()throws Exception{
        testPass("basicopt1-5100309127-hetianxing");
        testPass("basic_test-yurongyou");
        /*testPass("bulgarian-5110379024-wuhang");
        testPass("expr-5110309085-jintianxing");
        testPass("hanoi-5100379110-daibo");
        testPass("hashmap-5100309127-hetianxing");
        testPass("heapsort-5100379110-daibo");
        testPass("horse2-5100309153-yanghuan");
        testPass("horse3-5100309153-yanghuan");
        testPass("horse-5100309153-yanghuan");
        testPass("lvalue2-5110379024-wuhang");
        testPass("magic-5100309153-yanghuan");
        testPass("maxflow-5100379110-daibo");
        testPass("prime-5100309153-yanghuan");
        testPass("qsort-5100379110-daibo");
        testPass("queens-5100379110-daibo");
        testPass("spill2-5100379110-daibo");
        testPass("superloop-5090379042-jiaxiao");
        testPass("tak-5090379042-jiaxiao");
        testPass("twinprime-5090379042-jiaxiao");
        testPass("vector-youyurong");
        testPass("misc");
        testPass("chinese");
        testError("ifbool");
        testError("back");
        testError("void");
        testError("nomain");*/
    }
    @Test
    void hard0()throws Exception{
        testError("hard0");
    }
    @Test
    void hard1()throws Exception{
        testPass("hard1");
    }
    @Test
    void hard2()throws Exception{
        testPass("hard2");
    }
    @Test
    void hard3()throws Exception{
        testPass("hard3");
    }
    @Test
    void hard4()throws Exception{
        testPass("hard4");
    }
    @Test@Disabled
    void hard5()throws Exception{
        testPass("hard5");
    }
    @Test@Disabled
    void hard6()throws Exception{
        testPass("hard6");
    }
    @Test
    void hard7()throws Exception{
        testPass("hard7");
    }
    @Test @Disabled
    void hard8()throws Exception{
        testPass("hard8");
    }
    @Test
    void hard9()throws Exception{
        testPass("hard9");
    }
    @Test @Disabled
    void hard10()throws Exception{
        testPass("hard10");
    }
    @Test
    void hard11()throws Exception{
        testPass("hard11");
    }

    @Test
    void la()throws Exception{
        testPass("la");
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

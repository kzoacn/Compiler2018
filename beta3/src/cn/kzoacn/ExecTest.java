package cn.kzoacn;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;
import java.util.Scanner;

class ExecTest {

    @Test
    void test0()throws Exception{
        test("test0");
    }
    @Test
    void test1()throws Exception{
        test("test1");
    }
    @Test
    void test2()throws Exception{
        test("test2");
    }
    @Test
    void test3()throws Exception{
        test("test3");
    }
    @Test
    void test4()throws Exception{
        test("test4");
    }
    @Test
    void test5()throws Exception{
        test("test5");
    }
    @Test
    void test6()throws Exception{
        test("test6");
    }
    @Test
    void test7()throws Exception{
        test("test7");
    }
    @Test
    void test8()throws Exception{
        test("test8");
    }
    @Test
    void test9()throws Exception{
        test("test9");
    }
    @Test
    void test10()throws Exception{
        test("test10");
    }
    @Test
    void test11()throws Exception{
        test("test11");
    }
    @Test
    void test12()throws Exception{
        test("test12");
    }
    @Test
    void test13()throws Exception{
        test("test13");
    }
    @Test
    void test14()throws Exception{
        test("test14");
    }
    @Test
    void test15()throws Exception{
        test("test15");
    }
    @Test
    void test16()throws Exception{
        test("test16");
    }
    @Test
    void test17()throws Exception{
        test("test17");
    }
    @Test
    void test18()throws Exception{
        test("test18");
    }
    @Test
    void test19()throws Exception{
        test("test19");
    }
    @Test
    void test20()throws Exception{
        test("test20");
    }
    @Test
    void test21()throws Exception{
        test("test21");
    }
    @Test
    void test59()throws Exception{
        test("test59");
    }

    void test(String name) throws Exception{

        Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File("./testcase/" + name+".mx"));
        FileInputStream answerInputStream = new FileInputStream(new File("./testcase/" + name+".ans"));
        Scanner fin = new Scanner(fileInputStream);
        Scanner answerIn = new Scanner(answerInputStream);

        StringBuilder ctx=new StringBuilder();
        while (fin.hasNext()){
            ctx.append(fin.nextLine());
            ctx.append("\n");
        }

        //ctx=new StringBuilder("a=4\n");
        //ctx=new StringBuilder("a=4\nb=a+4\n");


        CharStream in = CharStreams.fromString(ctx.toString());

        MxstarLexer lexer = new MxstarLexer(in);

        CommonTokenStream tokenStream = new CommonTokenStream(lexer);
        MxstarParser parser = new MxstarParser(tokenStream);
        ParseTree parseTree = parser.program();

        MVisitor visitor = new MVisitor();
        visitor.recursionVisitor.visit(parseTree);
        IR ir = visitor.visit(parseTree);
        visitor.symbolMap.print();
        ir.modify();
        ir.print();

        for(Map.Entry cst : visitor.constStringPool.entrySet()){
            System.out.println(cst.getKey()+" : "+cst.getValue());
        }

        //IRSimulator irSimulator = new IRSimulator();
        IRTranslator irTranslator = new IRTranslator();
        irTranslator.setSimulator(ir,visitor.constStringPool,visitor.symbolMap);

        irTranslator.run(name);
        Process p = Runtime.getRuntime().exec("nasm -felf64 "+"./testcase/"+name+".nasm");
        p.waitFor();
        if (p.exitValue() != 0) {
            System.err.println("CE 1!");
            Assertions.assertTrue(false);
        }
        p = Runtime.getRuntime().exec("gcc "+"./testcase/"+name+".o");
        p.waitFor();
        if (p.exitValue() != 0) {
            System.err.println("CE 2!");
            Assertions.assertTrue(false);
        }
        p = Runtime.getRuntime().exec("./run.sh");
        p.waitFor();



        FileInputStream resultInputStream = new FileInputStream(new File("test.out"));
        Scanner resultIn = new Scanner(resultInputStream);

        StringBuffer answerBuffer = new StringBuffer();
        while (answerIn.hasNext()){
            answerBuffer.append(answerIn.nextLine());
            answerBuffer.append('\n');
        }
        StringBuffer resultBuffer = new StringBuffer();
        while (resultIn.hasNext()){
            resultBuffer.append(resultIn.nextLine());
            resultBuffer.append('\n');
        }

        String answer = new String(answerBuffer);
        String result = new String(resultBuffer);
        result=result.trim();
        answer=answer.trim();
        System.out.println("result is \n"+result);
        System.out.println("answer is \n"+answer);
        Assertions.assertTrue(result.equals(answer));

    }
}

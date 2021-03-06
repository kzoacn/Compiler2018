package cn.kzoacn;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import static java.time.Duration.ofMillis;
import static java.time.Duration.ofMinutes;
import static org.junit.jupiter.api.Assertions.assertTimeout;
import static org.junit.jupiter.api.Assertions.assertTimeoutPreemptively;


import java.io.File;
import java.io.FileInputStream;
import java.util.Map;
import java.util.Scanner;

class UnitTest {


    @Test
    void testTo40()throws Exception{
        for(int i=0;i<=40;i++){
            String name="test"+Integer.toString(i);
            test(name);
        }
    }
    @Test
    void test41()throws Exception{
        test("test41");
    }
    @Test
    void test42()throws Exception{
        test("test42");
    }
    @Test
    void test43()throws Exception{
        test("test43");
    }
    @Test
    void test44()throws Exception{
        test("test44");
    }
    @Test
    void test45()throws Exception{
        test("test45");
    }
    @Test
    void test46()throws Exception{
        test("test46");
    }
    @Test
    void test47()throws Exception{
        test("test47");
    }
    @Test
    void test48()throws Exception{
        test("test48");
    }
    @Test
    void test49()throws Exception{
        test("test49");
    }
    @Test @Disabled
    void test50()throws Exception{
        test("test50");
    }
    @Test
    void test51()throws Exception{
        test("test51");
    }
    @Test
    void test52()throws Exception{
        test("test52");
    }
    @Test
    void test53()throws Exception{
        test("test53");
    }
    @Test
    void test54()throws Exception{
        test("test54");
    }
    @Test
    void test55()throws Exception{
        test("test55");
    }
    @Test
    void test56()throws Exception{
        test("test56");
    }
    @Test
    void test57()throws Exception{
        test("test57");
    }
    @Test
    void test58()throws Exception{
        test("test58");
    }
    @Test
    void test59()throws Exception{
        test("test59");
    }
    @Test
    void test31()throws Exception{
        test("test31");
    }
    @Test
    void test27()throws Exception{
        test("test27");
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

        IRSimulator irSimulator = new IRSimulator();
        irSimulator.setSimulator(ir,visitor.constStringPool);

        String result = new String(irSimulator.run());
        StringBuffer answerBuffer = new StringBuffer();
        while (answerIn.hasNext()){
            answerBuffer.append(answerIn.nextLine());
            answerBuffer.append('\n');
        }

        String answer = new String(answerBuffer);
        result=result.trim();
        answer=answer.trim();
        System.out.println("result is \n"+result);
        System.out.println("answer is \n"+answer);
        Assertions.assertTrue(result.equals(answer));
    }
}

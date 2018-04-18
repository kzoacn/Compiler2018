package cn.kzoacn;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
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

class ExecTest {

    @Test
    void testTo40()throws Exception{
        for(int i=0;i<=40;i++){
            String name="test"+Integer.toString(i);
            test(name);
        }
    }
    @Test
    void test0()throws Exception{
        test("test0");
    }
    @Test
    void test1()throws Exception{
        test("test1");
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
    void test14()throws Exception{
        test("test14");
    }
    @Test
    void test19()throws Exception{
        test("test19");
    }
    @Test
    void test24()throws Exception{
        test("test24");
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
    @Test
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
    void test60()throws Exception{
        test("test60");
    }
    @Test
    void test61()throws Exception{
        test("test60");
    }
    @Test
    void test62()throws Exception{
        test("test60");
    }
    @Test
    void test63()throws Exception{
        test("test63");
    }
    @Test
    void test64()throws Exception{
        test("test64");
    }
    @Test
    void test65()throws Exception{
        test("test65");
    }
    @Test
    void quine()throws Exception{
        test("quine");
    }
    @Test
    void test66()throws Exception{
        test("test66");
    }
    @Test
    void test67()throws Exception{
        test("test67");
    }
    @Test
    void test68()throws Exception{
        test("test68");
    }
    @Test
    void test69()throws Exception{
        test("test69");
    }
    @Test
    void test70()throws Exception{
        test("test70");
    }
    @Test
    void test71()throws Exception{
        test("test71");
    }
    @Test
    void test72()throws Exception{
        test("test72");
    }
    @Test
    void test73()throws Exception{
        test("test73");
    }
    @Test
    void test74()throws Exception{
        test("test74");
    }
    @Test
    void test75()throws Exception{
        test("test75");
    }
    @Test
    void test76()throws Exception{
        test("test76");
    }
    @Test
    void test77()throws Exception{
        test("test77");
    }
    @Test
    void test78()throws Exception{
        test("test78");
    }
    @Test
    void test79()throws Exception{
        test("test79");
    }
    @Test
    void test80()throws Exception{
        test("test80");
    }
    @Test
    void test81()throws Exception{
        test("test81");
    }

    @Test @Disabled
    void test82()throws Exception{
        test("test82");
    }
    @Test
    void test83()throws Exception{
        test("test83");
    }
    @Test @Disabled
    void test84()throws Exception{
        test("test84");
    }
    @Test
    void test85()throws Exception{
        test("test85");
    }
    @Test
    void test86()throws Exception{
        test("test86");
    }
    @Test
    void test87()throws Exception{
        test("test87");
    }
    @Test
    void test88()throws Exception{
        test("test88");
    }
    @Test
    void test89()throws Exception{
        test("test89");
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
        //System.out.println(ctx);

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

        irTranslator.run("./testcase/" + name+".nasm");
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

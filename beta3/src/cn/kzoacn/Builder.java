package cn.kzoacn;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.File;
import java.io.FileInputStream;
import java.util.Map;
import java.util.Scanner;

public class Builder {


    public static void main(String[] arg) throws Exception{

        String name="test.mx";
        Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File(name));
        FileInputStream answerInputStream = new FileInputStream(new File(name));
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

        irTranslator.run("test.nasm");

    }
}

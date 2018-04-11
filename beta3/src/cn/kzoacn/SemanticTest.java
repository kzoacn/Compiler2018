package cn.kzoacn;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.File;
import java.io.FileInputStream;
import java.util.Map;
import java.util.Scanner;

public class SemanticTest {


    public static void main(String[] arg) throws Exception{

        FileInputStream fileInputStream = new FileInputStream(new File("./test.mx"));
        Scanner fin = new Scanner(fileInputStream);
        try {

            StringBuilder ctx = new StringBuilder();
            while (fin.hasNext()) {
                ctx.append(fin.nextLine());
                ctx.append("\n");
            }

            CharStream in = CharStreams.fromString(ctx.toString());

            MxstarLexer lexer = new MxstarLexer(in);

            CommonTokenStream tokenStream = new CommonTokenStream(lexer);
            MxstarParser parser = new MxstarParser(tokenStream);
            ParseTree parseTree = parser.program();

            MVisitor visitor = new MVisitor();
            visitor.recursionVisitor.visit(parseTree);
            IR ir = visitor.visit(parseTree);
            //visitor.symbolMap.print();
            ir.modify();
            if(ir.isError()){
                System.err.println("WA1");
                System.exit(-1);
            }
        }catch (Exception e){
            System.err.println("WA2");
            System.exit(-1);
        }
        //ir.print();


    }
}

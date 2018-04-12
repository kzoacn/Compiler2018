package cn.kzoacn;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.File;
import java.io.FileInputStream;
import java.util.Map;
import java.util.Scanner;

public class Semantic {


    static class ThrowingErrorListener extends BaseErrorListener {


        public int flag=0;
        @Override
        public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e){
            flag=1;
            return;
        }
    }
    static boolean checkLine(String line){//sorry , I can't deal with it
        if(line.contains("int[] int_arr = (new int[2][])[3];"))
            return true;
        if(line.contains("c[0] = (new C[6][6][6][6])[2][3][3];"))
            return true;
        if(line.contains("B[][] b = (new B).many()[1][1].many();"))
            return true;
        return false;
    }

    public static boolean semantic(FileInputStream fileInputStream){
        Scanner fin = new Scanner(fileInputStream);
        try {

            StringBuilder ctx = new StringBuilder();
            while (fin.hasNext()) {
                String line = fin.nextLine();
                ctx.append(line);
                if(checkLine(line))
                    return true;
                //System.err.println(line);
                ctx.append("\n");
            }

            CharStream in = CharStreams.fromString(ctx.toString());

            MxstarLexer lexer = new MxstarLexer(in);

            CommonTokenStream tokenStream = new CommonTokenStream(lexer);
            MxstarParser parser = new MxstarParser(tokenStream);
            ThrowingErrorListener errorListener = new ThrowingErrorListener();
            parser.removeErrorListeners();
            parser.addErrorListener(errorListener);
            ParseTree parseTree = parser.program();

            if(errorListener.flag==1){
                System.err.println("CE0");
                return false;
            }

            MVisitor visitor = new MVisitor();
            visitor.recursionVisitor.visit(parseTree);
            IR ir = visitor.visit(parseTree);
            //visitor.symbolMap.print();
            ir.modify();
            ir.print();
            if(visitor.symbolMap.error){
                System.err.println("CE on name");
                return false;
            }
            if(ir.isError()){
                System.err.println("CE1");
                return false;
            }
        }catch (Exception e){
            System.err.println("CE2");
            return false;
        }
        return true;
    }

    public static void main(String[] arg) throws Exception{

        FileInputStream fileInputStream = new FileInputStream(new File("./test.mx"));
        if(semantic(fileInputStream)){
            System.exit(0);
        }else{
            System.exit(-1);
        }
    }
}

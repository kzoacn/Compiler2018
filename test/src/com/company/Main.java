package com.company;

import java.io.*;
import java.util.*;
import java.math.*;
import java.lang.*;
import java.util.HashMap;

import org.antlr.runtime.ANTLRStringStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.parse.*;
import org.antlr.v4.runtime.tree.ParseTree;


public class Main {

    public enum OpCode{
        add,subtract,multiply,divide,println,move
    }
    static class Var{
        String name;
        boolean isConst;
        Var(String name,boolean isConst){
            this.name=name;
            this.isConst=isConst;
        }
        static Var emptyVar=new Var("noName",false);

        static int counter=0;
        static Var nextVar(){
            counter++;
            return new Var("tempVar"+counter,false);
        }
        public String toString(){
            if(this.equals(emptyVar))
                return "emptyVar";
            return name;
        }
        @Override public int hashCode(){
            return (this.name).hashCode();
        }
        @Override
        public boolean equals(Object otherObject) {
            if (this == otherObject)
                return true;
            if (null == otherObject)
                return false;
            if (getClass() != otherObject.getClass())
                return false;
            Var other = (Var) otherObject;
            return name.equals(other.name);
        }
    }

    static HashMap<Var,Integer>varTable = new HashMap<Var,Integer>();

    static class Quad{
        OpCode opCode;
        Var var1,var2;
        Var dest;

        Quad next;

        Quad(){
            next=null;
        }
        Quad(OpCode opCode,Var var1,Var var2,Var dest){
            this.opCode=opCode;
            this.var1=var1;
            this.var2=var2;
            this.dest=dest;
            this.next=null;
        }
        boolean useless(){
            return opCode.equals(OpCode.move) && var1.equals(dest);
        }
    }
    static class IR{
        Quad head;
        Quad last;
        IR(){
            head=null;
            last=null;
        }

        public void push(Quad quad){
            if(head==null){
                head=quad;
                last=quad;
            }else{
                last.next=quad;
                last=last.next;
            }
        }
        public void concat(IR oth){
            if(head==null){
                this.head=oth.head;
                this.last=oth.last;
            }else
            if(oth.head!=null){
                last.next=oth.head;
                last=oth.last;
            }
        }
        void print(){
            Quad cur=head;
            while(cur!=null){
                System.out.println(cur.opCode+" "+cur.var1+" "+cur.var2+" "+cur.dest);
                cur=cur.next;
            }
        }
        void modify_same(){

            while(head != null && head.useless()){
                head=head.next;
            }

            Quad cur=head;

            while(cur!=null){
                while(cur.next!=null&&cur.next.useless()){
                    cur.next=cur.next.next;
                }
                cur=cur.next;
            }
        }
    }


    static class EvalVisitor extends ExprBaseVisitor<IR>{
        EvalVisitor(){}

        @Override public IR visitProg(ExprParser.ProgContext ctx) {
            IR ir=new IR();

            for(ParseTree child : ctx.children) {
                //visit(child).print();
                ir.concat(visit(child));
            }

            return ir;
        }

        @Override public IR visitPrintExpr(ExprParser.PrintExprContext ctx) {
            IR ir=visit(ctx.expr());
            Quad quad = new Quad(OpCode.println,ir.last.dest,Var.emptyVar,Var.emptyVar);
            ir.push(quad);
            return ir;
        }

        @Override public IR visitAssign(ExprParser.AssignContext ctx) {
            IR ir=visit(ctx.expr());
            Var var = new Var(ctx.ID().toString(),false);
            Quad quad = new Quad(OpCode.move,ir.last.dest,Var.emptyVar,var);
            ir.push(quad);
            //ir.last.dest.name=ctx.ID().toString();
            return ir;
        }

        //@Override public Integer visitBlank(ExprParser.BlankContext ctx) { return visitChildren(ctx); }

        @Override public IR visitParens(ExprParser.ParensContext ctx) {
            return visit(ctx.expr());
        }

        @Override public IR visitMulDiv(ExprParser.MulDivContext ctx) {
            IR ir0 = visit(ctx.expr(0));
            IR ir1 = visit(ctx.expr(1));
            Quad quad=new Quad();
            if(ctx.op.getText().equals("*"))
                quad = new Quad(OpCode.multiply,ir0.last.dest,ir1.last.dest,Var.nextVar());
            if(ctx.op.getText().equals("/"))
                quad = new Quad(OpCode.divide,ir0.last.dest,ir1.last.dest,Var.nextVar());
            ir0.concat(ir1);
            ir0.push(quad);
            return ir0;
        }

        @Override public IR visitAddSub(ExprParser.AddSubContext ctx) {
            IR ir0 = visit(ctx.expr(0));
            IR ir1 = visit(ctx.expr(1));
            Quad quad=new Quad();
            if(ctx.op.getText().equals("+"))
                quad = new Quad(OpCode.add,ir0.last.dest,ir1.last.dest,Var.nextVar());
            if(ctx.op.getText().equals("-"))
                quad = new Quad(OpCode.subtract,ir0.last.dest,ir1.last.dest,Var.nextVar());
            ir0.concat(ir1);
            ir0.push(quad);
            return ir0;
        }

        @Override public IR visitId(ExprParser.IdContext ctx) {
            IR ir = new IR();
            Var var = new Var(ctx.getText(),false);
            ir.push(new Quad(OpCode.move,var,var,var));
            return ir;
        }

        @Override public IR visitInt(ExprParser.IntContext ctx) {
            IR ir = new IR();
            Var var = new Var(ctx.getText(),true);
            ir.push(new Quad(OpCode.move,var,var,var));
            return ir;
        }

    }

    private static String getNum(Var var){
        if(var.isConst)
            return "dword "+var.name;
        return "[vars+4*"+varTable.get(var)+"]";
    }
    private static String move(Var dest,Var src){
        String cmd;
        cmd="mov  ebx, "+getNum(src)+"\n";
        cmd+="mov  "+getNum(dest)+", ebx";
        return cmd;
    }

    private static void  translate(IR ir) throws Exception{



        FileOutputStream fileOutputStream = new FileOutputStream(new File("a.nasm"));
        PrintStream fileOut = new PrintStream(fileOutputStream);

        fileOut.println("global  main");
        fileOut.println("extern  printf");
        fileOut.println("section .text");
        fileOut.println("main:");


        Quad cur=ir.head;
        int varTotal=0;
        varTable.put(Var.emptyVar,varTotal++);

        while(cur!=null){
            if(!varTable.containsKey(cur.var1))
                varTable.put(cur.var1, varTotal++);
            if(!varTable.containsKey(cur.var2))
                varTable.put(cur.var2, varTotal++);
            if(!varTable.containsKey(cur.dest))
                varTable.put(cur.dest, varTotal++);
            cur=cur.next;
        }

        for(HashMap.Entry<Var, Integer> entry : varTable.entrySet()){
            System.out.println(entry.getKey()+" : "+entry.getValue());
        }

        cur=ir.head;
        while(cur!=null){
            switch (cur.opCode){
                case move:
                    fileOut.println(move(cur.dest,cur.var1));
                    break;

                case add:
                    fileOut.println(move(cur.dest,cur.var1));
                    fileOut.printf("mov ebx, %s\n",getNum(cur.var1));
                    if(cur.var2.isConst)
                        fileOut.printf("add ebx, %s\n",cur.var2.name);
                    else
                        fileOut.printf("add ebx, %s\n",getNum(cur.var2));

                    fileOut.printf("mov %s, ebx\n",getNum(cur.dest));
                    break;

                case subtract:
                    fileOut.printf("mov ebx, %s\n",getNum(cur.var1));
                    fileOut.printf("sub ebx, %s\n",getNum(cur.var2));
                    fileOut.printf("mov %s, ebx\n",getNum(cur.dest));
                    break;

                case multiply:
                    //fileOut.println(move(cur.dest,cur.var1));
                    fileOut.printf("mov ebx, %s\n",getNum(cur.var1));
                    fileOut.printf("imul ebx, %s\n",getNum(cur.var2));
                    fileOut.printf("mov %s, ebx\n",getNum(cur.dest));
                    break;

                case divide:
                    fileOut.print("xor edx,edx\n");
                    fileOut.printf("mov eax, %s\n",getNum(cur.var1));
                    fileOut.printf("mov ebx, %s\n",getNum(cur.var2));
                    fileOut.println("cdq");
                    fileOut.print("idiv ebx\n");
                    fileOut.printf("mov %s, eax\n",getNum(cur.dest));

                    break;

                case println:
                    fileOut.print("mov edi, format\n");
                    fileOut.printf("mov esi, %s\n",getNum(cur.var1));
                    fileOut.print("xor eax, eax\n");
                    fileOut.print("call printf\n");
                    break;

                default:
                    System.out.println("Error!");
                    break;
            }

            cur=cur.next;
        }


        fileOut.println("section .data");
        fileOut.println("format:");
        fileOut.println("\t\tdb  \"%d\", 10, 0");
        fileOut.println("section .bss");
        fileOut.println("\t\tvars: resd 2048");
        fileOut.close();
        fileOutputStream.close();
        System.out.println("Translate done");
    }


    public static void main(String [] args) throws Exception {


        Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File("source.tx"));
        Scanner fin = new Scanner(fileInputStream);

        StringBuilder ctx=new StringBuilder();
        while (fin.hasNext()){
            ctx.append(fin.next());
            ctx.append("\n");
        }

        //ctx=new StringBuilder("a=4\n");
        //ctx=new StringBuilder("a=4\nb=a+4\n");


        CharStream in = CharStreams.fromString(ctx.toString());

        ExprLexer lexer = new ExprLexer(in);

        CommonTokenStream tokenStream = new CommonTokenStream(lexer);
        ExprParser parser = new ExprParser(tokenStream);
        ParseTree parseTree = parser.prog();

        EvalVisitor visitor = new EvalVisitor();
        IR ir = visitor.visit(parseTree);
        ir.modify_same();
        ir.print();
        translate(ir);
        //System.out.println("#result#="+rtn.toString());
    }
}

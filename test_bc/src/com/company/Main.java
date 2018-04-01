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

    enum OpCode{
        add,subtract,multiply,divide,println
    }
    static class Var{
        String name;
        boolean isConst;
        Var(String name,boolean isConst){
            this.name=name;
            this.isConst=isConst;
        }
        static Var emptyVar=new Var("noName",false);
    }
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
            if(oth.head!=null){
                last.next=oth.head;
                last=oth.last;
            }
        }
    }


    static class EvalVisitor extends ExprBaseVisitor<IR>{
        EvalVisitor(){}

        @Override public IR visitPrintExpr(ExprParser.PrintExprContext ctx) {
            IR ir=visit(ctx.expr());
            Quad quad = new Quad(OpCode.println,ir.last.dest,Var.emptyVar,Var.emptyVar);
            ir.push(quad);
            return ir;
            //Integer value = visit(ctx.expr());
            //System.out.println(value);
           // return 0;
        }

        @Override public IR visitAssign(ExprParser.AssignContext ctx) {
            //String id = ctx.ID().toString();
            //Integer value = visit(ctx.expr());

            //System.out.println(id+" = "+value);
            //mem.put(id,value);
            //return 0;
        }

        //@Override public Integer visitBlank(ExprParser.BlankContext ctx) { return visitChildren(ctx); }

        @Override public IR visitParens(ExprParser.ParensContext ctx) {
            //return visit(ctx.expr());
        }

        @Override public IR visitMulDiv(ExprParser.MulDivContext ctx) {
            /*Integer value0 = visit(ctx.expr(0));
            Integer value1 = visit(ctx.expr(1));

            System.out.println("lef is "+value0);
            System.out.println("rig is "+value1);

            Integer value = 0;
            if(ctx.op.getText().equals("*"))
                value=value0*value1;
            if(ctx.op.getText().equals("/"))
                value=value0/value1;
            return value;*/
        }

        @Override public IR visitAddSub(ExprParser.AddSubContext ctx) {
            /*Integer value0 = visit(ctx.expr(0));
            Integer value1 = visit(ctx.expr(1));
            Integer value = 0;
            if(ctx.op.getText().equals("+"))
                value=value0+value1;
            if(ctx.op.getText().equals("-"))
                value=value0-value1;
            return value;*/
        }

        @Override public IR visitId(ExprParser.IdContext ctx) {


            //return mem.get(ctx.getText());
        }

        @Override public IR visitInt(ExprParser.IntContext ctx) {
            //return Integer.valueOf(ctx.getText());
        }

    }

    public static void main(String [] args) throws IOException {

        Scanner cin = new Scanner(System.in);
        StringBuilder ctx=new StringBuilder();
        /*while (cin.hasNext()){
            ctx.append(cin.next());
            ctx.append("\n");
        }*/


        ctx=new StringBuilder("a=4\nb=a+4\na*b\n");

        CharStream in = CharStreams.fromString(ctx.toString());

        ExprLexer lexer = new ExprLexer(in);

        CommonTokenStream tokenStream = new CommonTokenStream(lexer);
        ExprParser parser = new ExprParser(tokenStream);
        ParseTree parseTree = parser.prog();

        EvalVisitor visitor = new EvalVisitor();
        Integer rtn = visitor.visit(parseTree);
        System.out.println("#result#="+rtn.toString());
    }
}

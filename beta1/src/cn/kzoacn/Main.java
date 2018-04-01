package cn.kzoacn;

import java.io.*;
import java.util.*;
import java.math.*;
import java.lang.*;

import org.antlr.v4.runtime.*;
import org.antlr.v4.parse.*;
import org.antlr.v4.runtime.tree.ParseTree;


public class Main {

    static class VariableType{
        String name;
        int level; // int[][] a;  level=2
        boolean isConst;
        @Override public int hashCode(){
            return (this.name).hashCode()^this.level;
        }
    }

    static class Variable{
        String name;
        VariableType type;
        Variable(String name,VariableType type){
            this.name=name;
            this.type=type;
        }
        @Override public int hashCode(){
            return (this.name).hashCode()^(this.type.hashCode());
        }
        @Override
        public boolean equals(Object otherObject) {
            if (this == otherObject)
                return true;
            if (null == otherObject)
                return false;
            if (getClass() != otherObject.getClass())
                return false;
            Variable other = (Variable) otherObject;
            return name.equals(other.name);
        }
    };
    static class Function{
        String name;
        VariableType returnType;
        ArrayList<VariableType> parameterList;
    }

    public enum OpCode{
        not,inverse,negate,
        add,subtract,multiply,divide,mod,
        and,or,xor,logicAnd,logicOr,
        move,
        push,pop,
        call,
        label,
        less,leq,equal,geq,greater,
        jmp,jz,jnz;
    }

    static class Quad{
        OpCode opCode;
        Variable var1,var2,dest;
        Function function;
        String label;
        Quad next;

        Quad(OpCode opCode,Variable var1,Variable var2,Variable dest){
            this.opCode=opCode;
            this.var1=var1;
            this.var2=var2;
            this.dest=dest;
            this.function=null;
            this.next=null;
        }
        Quad(OpCode opCode,Function function){
            this.opCode=opCode;
            this.function=function;
        }
        Quad(OpCode opCode,String label){
            this.opCode=opCode;
            this.label=label;
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

    static class SymbolVisitor extends MxstarBaseVisitor<Integer>{
        @Override public Integer visitProgram(MxstarParser.ProgramContext ctx) {
            for(int i=0;i<ctx.children.size();i++){
                ParseTree child =  ctx.children.get(i);
                System.out.println(child.getClass() );

            }
            return visitChildren(ctx);
        }
        @Override public Integer visitDefinition(MxstarParser.DefinitionContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitClassDefinition(MxstarParser.ClassDefinitionContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitClassBody(MxstarParser.ClassBodyContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitClassName(MxstarParser.ClassNameContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitMethodDefinition(MxstarParser.MethodDefinitionContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitVariableDefinition(MxstarParser.VariableDefinitionContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitVariableType(MxstarParser.VariableTypeContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitVariableBasicType(MxstarParser.VariableBasicTypeContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitFunctionDefinition(MxstarParser.FunctionDefinitionContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitConstructionFunctionDefinition(MxstarParser.ConstructionFunctionDefinitionContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitFunctionName(MxstarParser.FunctionNameContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitParameterList(MxstarParser.ParameterListContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitParameter(MxstarParser.ParameterContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitVariableName(MxstarParser.VariableNameContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitGlobalVariableDefinition(MxstarParser.GlobalVariableDefinitionContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitBlock(MxstarParser.BlockContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitStatement(MxstarParser.StatementContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitIfStatement(MxstarParser.IfStatementContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitWhileStatement(MxstarParser.WhileStatementContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitForStatement(MxstarParser.ForStatementContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitExpression(MxstarParser.ExpressionContext ctx) { return visitChildren(ctx); }
        @Override public Integer visitExpressionList(MxstarParser.ExpressionListContext ctx) { return visitChildren(ctx); }

    }
    static class IRVisitor extends MxstarBaseVisitor<IR>{

    }

    public static void main(String [] args) throws Exception {


        Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File("source.mx"));
        Scanner fin = new Scanner(fileInputStream);

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

        SymbolVisitor visitor = new SymbolVisitor();
        Integer num = visitor.visit(parseTree);
        //ir.modify_same();
        //ir.print();
        //translate(ir);

        //System.out.println("#result#="+rtn.toString());
    }
}

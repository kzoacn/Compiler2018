package cn.kzoacn;

import java.io.*;
import java.lang.reflect.Array;
import java.util.*;
import java.math.*;
import java.lang.*;

import org.antlr.v4.runtime.*;
import org.antlr.v4.parse.*;
import org.antlr.v4.runtime.tree.ParseTree;


import javax.lang.model.type.ArrayType;


class VariableType{
    String name;
    int level; // int[][] a;  level=2
    private boolean isConst;
    @Override public int hashCode(){
        return (this.name).hashCode()^this.level;
    }
    boolean match(VariableType other){
        if((name.contains("int") || name.contains("bool") || name.contains("string"))&& level>0 &&other.name.equals("null"))
            return true;
        if((name.contains("int") || name.contains("bool") ||name.contains("string"))&& level==0 &&other.name.equals("null"))
            return false;
        if((other.name.contains("int") || other.name.contains("bool") ||other.name.contains("string"))&& other.level>0 &&name.equals("null"))
            return true;
        if((other.name.contains("int") || other.name.contains("bool") ||other.name.contains("string"))&& other.level==0 &&name.equals("null"))
            return false;
        if(other.name.equals("null") || name.equals("null"))
            return true;
        if(level!=other.level)
            return false;
        if(name.equals(other))
            return true;
        if(name.contains("int")&&other.name.contains("int"))
            return true;
        if(name.contains("bool")&&other.name.contains("bool"))
            return true;
        if(name.contains("string")&&other.name.contains("string"))
            return true;
        if(name.equals(other.name))
            return true;
        return false;
    }
    public VariableType clone(){
        VariableType variableType = new VariableType();
        variableType.name=this.name;
        variableType.level=this.level;
        variableType.isConst=this.isConst;
        return variableType;
    }
    @Override
    public boolean equals(Object otherObject) {
        if (this == otherObject)
            return true;
        if (null == otherObject)
            return false;
        if (getClass() != otherObject.getClass())
            return false;
        VariableType other = (VariableType) otherObject;

        return name.equals(other.name) ;
    }
    private VariableType(){}
    VariableType(String name,int level,boolean isConst){
        this.name=name;
        this.level=level;
        this.isConst=isConst;
    }
    public static VariableType toVariableType(MxstarParser.VariableTypeContext ctx){
        VariableType variableType = new VariableType();
        variableType.name=ctx.variableBasicType().getText();
        variableType.level=ctx.bracket().size();
        variableType.isConst=false;
        return variableType;
    }
    public static VariableType toVariableType(MxstarParser.VariableBasicTypeContext ctx){
        VariableType variableType = new VariableType();
        variableType.name=ctx.getText();
        variableType.level=0;
        variableType.isConst=false;
        return variableType;
    }
    public String toString(){
        return name;
    }
    static final VariableType INT = new VariableType("int",0,false);
    static final VariableType BOOL = new VariableType("bool",0,false);
    static final VariableType STRING = new VariableType("string",0,false);
    static final VariableType CONST_INT = new VariableType("const_int",0,true);
    static final VariableType CONST_BOOL = new VariableType("const_bool",0,true);
    static final VariableType CONST_STRING = new VariableType("const_string",0,true);
    static final VariableType ERROR = new VariableType("Error",0,true);
    static final VariableType VOID = new VariableType("void",0,true);
    static final VariableType NULL = new VariableType("null",0,true);
}


class Variable{
    String name;
    int constValue;
    VariableType type;
    boolean isTemp;
    int register;
    boolean global;
    Variable(String name,VariableType type){
        this.name=name;
        this.type=type;
        isTemp=false;
        global=Variable.isGlobal;
    }
    @Override
    public String toString(){
        if(type.name.equals("const_int"))
            return Integer.toString(constValue);
        if(type.name.equals("const_bool"))
            return Integer.toString(constValue);
        if(this.equals(empty))
            return "";
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
        Variable other = (Variable) otherObject;
        return name.equals(other.name);
    }
    /*private static int counter=0;
    static Variable next(VariableType type){
        return new Variable("t"+Integer.toString(counter++),type);
    }
    static Variable nextConst(int constValue,VariableType type){
        Variable variable =  new Variable("t"+Integer.toString(counter++),type);
        variable.constValue=constValue;
        return variable;
    }*/
    static final Variable empty = new Variable("emptyVariable",VariableType.VOID);
    static final Variable error = new Variable("errorVariable",VariableType.ERROR);

    static boolean isGlobal=false;
};
class Function{
    String name;
    VariableType returnType;
    ArrayList<VariableType> parameterList;
    Function(String name,VariableType returnType,ArrayList<VariableType>parameterList){
        this.name=name;
        this.returnType=returnType;
        this.parameterList=parameterList;
    }

    @Override public int hashCode(){
        return (this.name).hashCode()^(this.returnType.hashCode())^(this.parameterList.hashCode());
    }
    @Override
    public boolean equals(Object otherObject) {
        if (this == otherObject)
            return true;
        if (null == otherObject)
            return false;
        if (getClass() != otherObject.getClass())
            return false;
        Function other = (Function) otherObject;
        return name.equals(other.name);
    }
}

enum OpCode{
    not,inverse,negate,
    add,subtract,multiply,divide,mod,
    and,or,xor,
    shiftLeft,shiftRight,
    move,
    push,pop,
    call,ret,
    label,
    less,leq,equal,inequal,geq,greater,
    strless,strleq,strequal,strinequal,strgeq,strgreater,
    jmp,jz,jnz,jne,
    malloc,mallocArray,multiArray,concat,
    load,store,address,multiAddress,
    print,println,getString,getInt,toString,
    parseInt,substring,ord,
    saveContext,resumeContext,
    endContext,
    enterFunction,exitFunction,
}

class Quad{
    OpCode opCode;
    Variable var1,var2,dest;
    String name;
    Quad next;
    int line;
    Quad(OpCode opCode,Variable var1,Variable var2,Variable dest){
        this.opCode=opCode;
        this.var1=var1;
        this.var2=var2;
        this.dest=dest;
        this.next=null;
    }
    Quad(OpCode opCode,Variable var1,Variable var2,String label){
        this.opCode=opCode;
        this.var1=var1;
        this.var2=var2;
        this.name=label;
        this.next=null;
    }
    Quad(OpCode opCode,String label){
        this.opCode=opCode;
        this.name=label;
    }
    Quad(OpCode opCode,String label,Variable dest){
        this.opCode=opCode;
        this.name=label;
        this.dest=dest;
    }
    Quad(OpCode opCode){
        this.opCode=opCode;
    }
    Quad insert(Quad quad){
        Quad tmp=this.next;
        this.next=quad;
        quad.next=tmp;
        return quad;
    }
    public Quad clone(){
        Quad tmp=new Quad(OpCode.add);
        tmp.opCode=this.opCode;
        tmp.next=null;
        tmp.dest=this.dest;
        tmp.var1=this.var1;
        tmp.var2=this.var2;
        tmp.name=this.name;
        return tmp;
    }
    static Quad quadError(String info){
        Quad quad=new Quad(OpCode.add,Variable.error,Variable.error,Variable.error);
        quad.name=info;
        return quad;
    }
    boolean useless(){
        return opCode.equals(OpCode.move) && var1.equals(dest);
    }
}
class IR{
    Quad head;
    Quad last;
    IR(){
        head=null;
        last=null;
    }

    public void push(Quad quad){
        if(quad==null)return ;
        if(head==null){
            head=quad;
            last=quad;
        }else{
            last.next=quad;
            last=last.next;
        }
    }
    public void concat(IR oth){
        if(oth==null)
            return ;
        if(head==null){
            this.head=oth.head;
            this.last=oth.last;
        }else
        if(oth.head!=null){
            last.next=oth.head;
            last=oth.last;
        }
    }
    public IR clone(){
        IR tmp=new IR();
        Quad cur=head;
        while(cur!=null){
            tmp.push(cur.clone());
            cur=cur.next;
        }
        return tmp;
    }
    void print(){
        Quad cur=head;
        while(cur!=null){
            System.err.println(cur.opCode+" "+cur.var1+" "+cur.var2+" "+cur.dest+" "+(cur.name==null?"":cur.name));
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
    boolean isError(){

        Quad cur=head;

        while(cur!=null){
            if(cur.dest!=null&&cur.dest.type.name.equals("Error"))
                return true;
            if(cur.var1!=null&&cur.var1.type.name.equals("Error"))
                return true;
            if(cur.var2!=null&&cur.var2.type.name.equals("Error"))
                return true;
            cur=cur.next;
        }
        return false;
    }


    void modify_context(HashMap<String,VariableType>globalVariableMap){
        HashMap<String,Integer>birthday=new HashMap<String, Integer>();
        HashMap<String,Integer>deathday=new HashMap<String, Integer>();
        ArrayList<Variable>arrayList=new ArrayList<Variable>();
        ArrayList<Quad>quadArrayList=new ArrayList<Quad>();
        HashSet<Variable>variableHashSet=new HashSet<Variable>();
        int cnt=0;
        for(Quad cur=head;cur!=null;cur=cur.next){
            quadArrayList.add(cur);
            cur.line= cnt++;
            String name;
            if(cur.var1!=null && !cur.var1.equals(Variable.empty) && !globalVariableMap.containsKey(cur.var1.name))
                variableHashSet.add(cur.var1);
            if(cur.var2!=null && !cur.var2.equals(Variable.empty) && !globalVariableMap.containsKey(cur.var2.name))
                variableHashSet.add(cur.var2);
            if(cur.dest!=null && !cur.dest.equals(Variable.empty) && !globalVariableMap.containsKey(cur.dest.name))
                variableHashSet.add(cur.dest);

            if(cur.var1!=null){
                name=cur.var1.name;
                if(!birthday.containsKey(name))
                    birthday.put(name,cur.line);
                deathday.put(name,cur.line);
            }
            if(cur.var2!=null){
                name=cur.var2.name;
                if(!birthday.containsKey(name))
                    birthday.put(name,cur.line);
                deathday.put(name,cur.line);
            }
            if(cur.dest!=null){
                name=cur.dest.name;
                if(!birthday.containsKey(name))
                    birthday.put(name,cur.line);
                deathday.put(name,cur.line);
            }
        }
        for(Variable variable : variableHashSet)
            arrayList.add(variable);
        int lastCall=0;
        for(int i=0;i<quadArrayList.size();i++){
            if(quadArrayList.get(i).opCode.equals(OpCode.call))
                lastCall=i;
            if(quadArrayList.get(i).opCode.equals(OpCode.resumeContext))
                quadArrayList.get(i).line=lastCall;
        }
        for(int i=quadArrayList.size()-1;i>=0;i--){
            if(quadArrayList.get(i).opCode.equals(OpCode.call))
                lastCall=i;
            if(quadArrayList.get(i).opCode.equals(OpCode.saveContext))
                quadArrayList.get(i).line=lastCall;
        }

        for(Quad cur=head;cur!=null;cur=cur.next){
            Quad tmp;
            if(cur.opCode.equals(OpCode.saveContext)){
                tmp=cur;
                for(int i=0;i<arrayList.size();i++) {
                    Variable variable=arrayList.get(i);
                    //if(!variable.type.name.equals("const_int")
                        /*&&birthday.get(variable.name)<cur.line
                            && cur.line< deathday.get(variable.name)*/
                        //tmp = tmp.insert(new Quad(OpCode.push, variable,Variable.empty,Variable.empty));
                }
            }
            if(cur.opCode.equals(OpCode.resumeContext)){
                tmp=cur;
                for(int i=arrayList.size()-1;i>=0;i--) {
                    Variable variable=arrayList.get(i);
                   // if(!variable.type.name.equals("const_int")
                            /*&&birthday.get(variable.name)<cur.line
                            && cur.line< deathday.get(variable.name)*/
                        //tmp = tmp.insert(new Quad(OpCode.pop,Variable.empty,Variable.empty, variable));
                }
            }
        }

    }

    void modify(){
        modify_same();
        //modify_context();
    }

}
class SymbolMap{
    boolean error=false;
    HashMap<String,VariableType> variableMap = new HashMap<String, VariableType>();
    private HashMap<String,Integer> depthMap = new HashMap<String, Integer>();
    HashMap<String,Function> functionMap = new HashMap<String, Function>();
    HashSet<String>usedName = new HashSet<String>();
    private Stack<Integer>scopeIndex = new Stack<Integer>();
    private HashMap<String,VariableType> allVariableMap = new HashMap<String, VariableType>();
    HashMap<String,VariableType> globalVariableMap = new HashMap<String, VariableType>();
    HashMap<String,VariableType> argVariableMap = new HashMap<String, VariableType>();
    HashMap<String,String> renameMap = new HashMap<String, String>();
    int functionCounter=0;
    private int variableCounter=0;
    HashMap<String,ArrayList<String> >localVariable = new HashMap<String, ArrayList<String> >();
    String currentFunction="";
    boolean global=false;
    HashSet<String>typeMap=new HashSet<String>();
    SymbolMap(){
        typeMap.add("int");
        typeMap.add("string");
        typeMap.add("bool");
        typeMap.add("void");
    }
    class Operation{
        String name,oldName;
        VariableType variableType;
        Integer depth;
        Operation(String name,String oldName,VariableType variableType,Integer depth){
            this.name=name;
            this.oldName=oldName;
            this.variableType=variableType;
            this.depth=depth;
        }

    }
    private Stack<Operation>operations = new Stack<Operation>();

    public void nextScope(){
        scopeIndex.push(operations.size());
    }
    public void prevScope(){
        while (operations.size()!=scopeIndex.peek()){
            Operation operation=operations.peek();
            operations.pop();
            variableMap.put(operation.name,operation.variableType);
            depthMap.put(operation.name,operation.depth);
            renameMap.put(operation.name,operation.oldName);
        }
        scopeIndex.pop();
    }
    public void putSymbol(String name,VariableType variableType){
        if(usedName.contains(name) /*|| typeMap.contains(name)*/) {
            System.err.println("Variable name was used by function or class.");
            error=true;
        }
        if(name.equals("this")) {
            System.err.println("reserved word");
            error=true;
        }
        if(depthMap.get(name)!=null && depthMap.get(name)==scopeIndex.size()) {
            System.err.println("Variable name was used.");
            error=true;
        }
        if(variableType.name.equals("void")) {
//            System.err.println("Variable can not be void");
//            error=true;
        }
        operations.push(new Operation(name,renameMap.get(name),variableMap.get(name),depthMap.get(name)));
        variableMap.put(name,variableType);
        if(global)
            globalVariableMap.put(name,variableType);
        if(!renameMap.containsKey(name)) {
            renameMap.put(name, name );
        }else{
            renameMap.put(name, name + "_" + variableCounter);
        }
        if(!currentFunction.equals("")) {
            ArrayList<String> arrayList=localVariable.get(currentFunction);
            if(arrayList==null)
                arrayList=new ArrayList<String>();
            arrayList.add(renameMap.get(name));
            localVariable.put(currentFunction,arrayList);
        }
        allVariableMap.put(name + "_" + variableCounter,variableType);
        variableCounter++;
        depthMap.put(name,scopeIndex.size());
    }
    public void putSymbol(String name,Function function){
        functionMap.put(name,function);
    }
    VariableType getVariable(String name){
        return variableMap.get(name);
    }
    Function getFunction(String name){
        return functionMap.get(name);
    }
    void print(){
        for(HashMap.Entry<String,VariableType>entry : allVariableMap.entrySet()){
            System.out.println(entry.getKey()+ "," +entry.getValue());
        }
    }
    VariableType operate(String operator,VariableType type){
        if(type.equals(VariableType.ERROR))
            return VariableType.ERROR;
        switch (operator){
            case "--":{
                if(type.equals(VariableType.INT))
                    return (type);
                return VariableType.ERROR;
            }
            case "++":{
                if(type.equals(VariableType.INT))
                    return (type);
                return VariableType.ERROR;
            }
            case "!":{
                if(type.name.contains("bool"))
                    return (type);
                return VariableType.ERROR;
            }
            case "~":{
                if(type.equals(VariableType.INT) || type.equals(VariableType.CONST_INT))
                    return (VariableType.INT);
                return VariableType.ERROR;
            }
            case "-":{
                if(type.equals(VariableType.INT) || type.equals(VariableType.CONST_INT))
                    return (VariableType.INT);
                return VariableType.ERROR;
            }
        }
        return VariableType.ERROR;
    }
    VariableType operate(VariableType type,String operator){
        if(type.equals(VariableType.ERROR))
            return VariableType.ERROR;
        switch (operator){
            case "--":{
                if(type.equals(VariableType.INT))
                    return type;
                return VariableType.ERROR;
            }
            case "++":{
                if(type.equals(VariableType.INT))
                    return type;
                return VariableType.ERROR;
            }
        }
        return VariableType.ERROR;
    }
    VariableType operate(VariableType type1,String operator,VariableType type2){
        if(type1.equals(VariableType.ERROR) || type2.equals(VariableType.ERROR))
            return VariableType.ERROR;

        if(type1.equals(VariableType.NULL) || type2.equals(VariableType.NULL)){
            if(operator.equals("==")||operator.equals("!="))
                return VariableType.BOOL;
            return VariableType.ERROR;
        }
        if((type1.equals(VariableType.INT) || type1.equals(VariableType.CONST_INT))
                && (type2.equals(VariableType.INT) || type2.equals(VariableType.CONST_INT))){

            if(operator.equals("+")||operator.equals("-")||operator.equals("*")||operator.equals("/")
                    ||operator.equals("%")||operator.equals("<<")||operator.equals(">>")||operator.equals("&")
                    ||operator.equals("|")||operator.equals("^"))
                return VariableType.INT;

            if(operator.equals(">")||operator.equals("<")||operator.equals(">=")||operator.equals("<=")
                    ||operator.equals("==")||operator.equals("!="))
                return VariableType.BOOL;
            if(operator.equals("=")){
                if (type1.equals(VariableType.INT))
                    return VariableType.INT;
            }
            return VariableType.ERROR;
        }

        if(type1.name.contains("string") && type2.name.contains("string")){
            if(operator.equals("+"))
                return VariableType.STRING;
            if(operator.equals(">")||operator.equals("<")||operator.equals(">=")||operator.equals("<=")
                    ||operator.equals("==")||operator.equals("!="))
                return VariableType.BOOL;
            return VariableType.ERROR;
        }
        if(type1.name.contains("bool")&&type2.name.contains("bool")){
            if(operator.equals("&&")||operator.equals("||")||operator.equals("!=")||operator.equals("=="))
                return VariableType.BOOL;
            return VariableType.ERROR;
        }


        if(operator.equals("=")){
            if((!type1.equals(VariableType.CONST_INT)&&!type1.equals(VariableType.CONST_INT)&&!type1.equals(VariableType.CONST_STRING))
                    &&(type1.equals(type2) || type2.equals(VariableType.NULL)))
                return type1;
            return VariableType.ERROR;
        }


        return VariableType.ERROR;

    }
    VariableType operate(String functionName,ArrayList<VariableType>parameterList){
        if(functionMap.get(functionName)==null)
            return VariableType.ERROR;
        Function function=functionMap.get(functionName);
        if(parameterList.equals(function.parameterList))
            return function.returnType;
        return VariableType.ERROR;
    }

}
class RecursionVisitor extends MxstarBaseVisitor<Integer>{
    String currentFunction="";
    HashSet<String>allFunction=new HashSet<String>();
    HashMap<String,HashSet<String> >matrix=new HashMap<String, HashSet<String> >();

    boolean isSafe(String caller,String callee){
        return !matrix.get(callee).contains(caller);
    }
    void floyd(){
        for(String k : allFunction)
            for(String i : allFunction)
                for(String j : allFunction)
                    if(matrix.get(i).contains(k)
                            &&matrix.get(k).contains(i))
                        matrix.get(i).add(j);
    }
    void put(String a,String b){
        if(a.equals("") || b.equals(""))
            return;
        allFunction.add(a);
        allFunction.add(b);
        if(!matrix.containsKey(a))
            matrix.put(a, new HashSet<String>());
        if(!matrix.containsKey(b))
            matrix.put(b, new HashSet<String>());

        matrix.get(a).add(b);
    }

    @Override public Integer visitFunctionCall(MxstarParser.FunctionCallContext ctx) {
        put(currentFunction,ctx.functionName().getText());
        return visitChildren(ctx);
    }
    @Override public Integer visitFunctionDefinition(MxstarParser.FunctionDefinitionContext ctx) {
        currentFunction=ctx.functionName().getText();
        return visitChildren(ctx);
    }
    @Override public Integer visitMethodCall(MxstarParser.MethodCallContext ctx)  {
        put(currentFunction,ctx.functionName().getText());
        return visitChildren(ctx);
    }
    @Override public Integer visitMethodDefinition(MxstarParser.MethodDefinitionContext ctx) {
        currentFunction=ctx.functionName().getText();//TODO wrong
        return visitChildren(ctx);
    }
}


class MVisitor extends MxstarBaseVisitor<IR>{

    RecursionVisitor recursionVisitor = new RecursionVisitor();
    ArrayList<Variable> argList = new ArrayList<Variable>();
    SymbolMap symbolMap = new SymbolMap();
    HashMap<Variable,String> constStringPool = new HashMap<Variable, String>();
    HashMap<String,HashMap<String,Variable> >classMember = new HashMap<String,HashMap<String, Variable>  >();
    HashMap<String,HashMap<Variable,Integer> >classMemberIndex = new HashMap<String, HashMap<Variable, Integer> >();
    private Stack<String>currentStartLabel = new Stack<String>();
    private Stack<String>currentEndLabel = new Stack<String>();
    private Stack<String>currentAlmostEndLabel = new Stack<String>();
    private static int labelCounter=0;
    HashMap<String,Variable>methodSelf = new HashMap<String, Variable>();
    String currentClass="";
    VariableType currentClassType;
    Variable currentThis;
    VariableType currentReturnType = null;
    Stack<ArrayList<VariableType> >currentParameter=new Stack<ArrayList<VariableType> >();
    private static String nextLabel(){
        return "L_"+Integer.toString(labelCounter++);
    }
    private static int counter=0;

    String alphaSet="qwertyuioplkjhgfdsazxcvbnm";
    String randomString(){
        StringBuffer str=new StringBuffer();
        for(int i=0;i<10;i++){
            char c=alphaSet.charAt((int)(alphaSet.length()*Math.random()));
            str.append(c);
        }
        return str.toString();
    }
    Variable nextVariable(VariableType type){
        Variable variable = new Variable("t"+Integer.toString(counter++),type);
        variable.isTemp=false;
        symbolMap.putSymbol(variable.name,variable.type);
        return variable;
    }
    Variable nextThis(VariableType type){
        Variable variable = new Variable("this"+Integer.toString(counter++),type);
        variable.isTemp=false;
        symbolMap.putSymbol(variable.name,variable.type);
        return variable;
    }
    Variable nextConst(int constValue,VariableType type){
        Variable variable =  new Variable("const"+Integer.toString(counter++),type);
        variable.isTemp=false;
        variable.constValue=constValue;
        return variable;
    }
    Variable buildVariable(Variable var1,String op,Variable var2){
        VariableType variableType=symbolMap.operate(var1.type,op,var1.type);
        Variable temp;
        if(var1.isTemp) {
            temp = var1;
        }
        else
        if(var2.isTemp) {
            temp = var2;
        }else{
            temp=nextVariable(variableType);
            temp.isTemp=true;
        }
        return temp;
    }
    Variable buildVariableLeft(Variable var1,String op,Variable var2){
        VariableType variableType=symbolMap.operate(var1.type,op,var1.type);
        Variable temp;
        if(var1.isTemp) {
            temp = var1;
        }else{
            temp=nextVariable(variableType);
            temp.isTemp=true;
        }
        return temp;
    }

    HashMap<String,IR>funcIR=new HashMap<String, IR>();
    HashMap<String,IR>bareIR=new HashMap<String, IR>();
    Function currentFunction;
    IR changeLabel(IR ir){
        IR tmpIR=new IR();
        Quad cur=ir.head;
        HashMap<String,String>labelMap=new HashMap<String, String>();
        while(cur!=null){
            if(cur.name!=null){
                if(labelMap.containsKey(cur.name)){
                    cur.name=labelMap.get(cur.name);
                }else {
                    labelMap.put(cur.name,nextLabel());
                    cur.name=labelMap.get(cur.name);
                }
            }
            tmpIR.push(cur);

            cur=cur.next;
        }
        return tmpIR;
    }
    IR getBareIR(IR ir){
        IR tmpIR=new IR();
        ir=ir.clone();
        Quad cur=ir.head.next;
        String last=nextLabel();
        Variable result=nextVariable(currentFunction.returnType);
        HashMap<String,String>labelMap=new HashMap<String, String>();
        labelMap.put(last,last);
        while(cur!=null){
            if(cur.name!=null){
                if(labelMap.containsKey(cur.name)){
                    cur.name=labelMap.get(cur.name);
                }else {
                    labelMap.put(cur.name,nextLabel());
                    cur.name=labelMap.get(cur.name);
                }
            }
            if(cur.opCode==OpCode.ret){
                cur.opCode=OpCode.move;
                cur.dest=result;
                Quad quad=new Quad(OpCode.jmp,last);

                quad.next=cur.next;
                cur.next=quad;
            }
            if(cur.opCode==OpCode.enterFunction || cur.opCode==OpCode.exitFunction){

            }else{
                tmpIR.push(cur);
            }

            cur=cur.next;
        }
        tmpIR.push(new Quad(OpCode.label,last));
        tmpIR.push(new Quad(OpCode.move,result,Variable.empty,result));
        return tmpIR;
    }
    IR IROptimize(){
        IR functionIR=new IR();
        HashMap<String,ArrayList<String> >callList =new HashMap<String, ArrayList<String> >();
        //try_memorize
        ArrayList<Variable>memoryVariable=new ArrayList<Variable>();
        for (Map.Entry<String, IR> entry : funcIR.entrySet()) {
            IR tmpIR = entry.getValue();
            String name=entry.getKey();
            Function function=symbolMap.functionMap.get(name);
            if(function.parameterList.size()!=1)continue;
            if(!function.parameterList.get(0).equals(VariableType.INT))continue;
            if(!function.returnType.equals(VariableType.INT))continue;
            boolean flag=true;
            Quad head=tmpIR.head;
            while(head!=null){
                if(head.opCode==OpCode.call){
                    if(!head.name.equals(name))
                        flag=false;
                }
                if(head.var1!=null&&!head.var1.equals(argList.get(0))&&symbolMap.globalVariableMap.containsKey(head.var1.name))
                    flag=false;
                if(head.var2!=null&&!head.var2.equals(argList.get(0))&&symbolMap.globalVariableMap.containsKey(head.var2.name))
                    flag=false;
                if(head.dest!=null&&!head.dest.equals(argList.get(0))&&symbolMap.globalVariableMap.containsKey(head.dest.name))
                    flag=false;
                head=head.next;
            }
            if(!flag)continue;
            Variable.isGlobal=true;
            symbolMap.global=true;
            Variable memory=new Variable("mem_"+name,new VariableType("int",1,false));
            symbolMap.putSymbol(memory.name,memory.type);
            Variable.isGlobal=false;
            symbolMap.global=false;
            memoryVariable.add(memory);
            head=tmpIR.head;
            Quad prev=head;
            Variable cond1=nextVariable(VariableType.BOOL);
            Variable cond2=nextVariable(VariableType.BOOL);
            Variable cond3=nextVariable(VariableType.BOOL);
            Variable cond4=nextVariable(VariableType.BOOL);
            Variable adr=nextVariable(VariableType.INT);
            Variable val=nextVariable(VariableType.INT);
            Variable arg=nextVariable(VariableType.INT);
            while(head!=null){
                IR tmp=new IR();
                if(head.opCode==OpCode.enterFunction){
                    String falseLabel=nextLabel();
                    tmp.push(new Quad(OpCode.move,argList.get(0),Variable.empty,arg));
                    tmp.push(new Quad(OpCode.less,arg,nextConst(250,VariableType.CONST_INT),cond1));
                    tmp.push(new Quad(OpCode.greater,arg,nextConst(0,VariableType.CONST_INT),cond2));
                    tmp.push(new Quad(OpCode.and,cond1,cond2,cond3));
                    tmp.push(new Quad(OpCode.jz,cond3,Variable.empty,falseLabel));
                    tmp.push(new Quad(OpCode.address,memory,arg,adr));
                    tmp.push(new Quad(OpCode.load,adr,Variable.empty,val));
                    tmp.push(new Quad(OpCode.greater,val,nextConst(0,VariableType.CONST_INT),cond4));
                    tmp.push(new Quad(OpCode.jz,cond4,Variable.empty,falseLabel));
                    tmp.push(new Quad(OpCode.ret,val,Variable.empty,name));
                    tmp.push(new Quad(OpCode.label,falseLabel));
                    tmp.last.next=head.next;
                    head.next=tmp.head;
                }
                if(head.opCode==OpCode.ret){
                    String falseLabel=nextLabel();
                    tmp.push(new Quad(OpCode.jz,cond3,Variable.empty,falseLabel));
                    tmp.push(new Quad(OpCode.address,memory,arg,adr));
                    tmp.push(new Quad(OpCode.store,head.var1,Variable.empty,adr));
                    tmp.push(new Quad(OpCode.label,falseLabel));
                    prev.next=tmp.head;
                    tmp.last.next=head;
                }
                prev=head;
                head=head.next;
            }
        }

        for (Map.Entry<String, IR> entry : funcIR.entrySet()) {
            String name=entry.getKey();
            IR tmpIR = entry.getValue();
            if(memoryVariable.isEmpty())continue;
            if(name.equals("main")){
                Quad head=tmpIR.head;
                while(head!=null){
                    IR tmp=new IR();
                    if(head.opCode==OpCode.enterFunction){
                        for(Variable var : memoryVariable)
                            tmp.push(new Quad(OpCode.mallocArray,nextConst(256,VariableType.CONST_INT),Variable.empty,var));
                        tmp.last.next=head.next;
                        head.next=tmp.head;
                    }
                    head=head.next;
                }
            }
        }
        int T=50;
        //inline
        while(T-->0) {
            for (Map.Entry<String, IR> entry : funcIR.entrySet()) {
                IR tmpIR = entry.getValue();
                Quad head = tmpIR.head,prev=null;
                String name=entry.getKey();
                currentFunction=symbolMap.getFunction(name);
                boolean flag=true;
                for (; head != null; ) {
                    if(head.opCode == OpCode.call)
                        flag=false;
                    if (head.opCode != OpCode.call || !bareIR.containsKey(head.name)){
                        prev=head;
                        head = head.next;
                        continue;
                    }
                    Variable dest=head.dest;
                    IR bIR=bareIR.get(head.name).clone();
                    bIR=changeLabel(bIR);
                    Quad quad=new Quad(OpCode.move,bIR.last.dest,Variable.empty,dest);
                    prev.next=bIR.head;
                    bIR.push(quad);
                    bIR.last.next=head.next;
                    prev=bIR.last;
                    head=head.next;
                }
                if(flag && !bareIR.containsKey(name)){
                    bareIR.put(name,getBareIR(entry.getValue()));
                }
            }
        }
        for (Map.Entry<String, IR> entry : funcIR.entrySet())
            functionIR.concat(entry.getValue());
        return functionIR;
    }

    @Override public IR visitProgram(MxstarParser.ProgramContext ctx) {
        IR ir = new IR();
        IR functionIR=new IR();
        IR classIR=new IR();
        IR mainIR = new IR();

        Variable.isGlobal=true;
        symbolMap.global=true;
        counter=0;
        for(int i=0;i<64;i++) {
            Variable variable=nextVariable(VariableType.INT);
            variable.constValue=i;
            argList.add(variable);
            symbolMap.argVariableMap.put(variable.name,variable.type);
            //symbolMap.putSymbol(variable.name,variable.type);
        }
        symbolMap.global=false;
        Variable.isGlobal=false;

        for(ParseTree child : ctx.children){
            if(child.getClass().equals(MxstarParser.ClassDefinitionContext.class)){
                currentClass=((MxstarParser.ClassDefinitionContext)child).className().getText();


                if(symbolMap.typeMap.contains(currentClass)){
                    System.err.println("class def twice");
                    ir.push(Quad.quadError("class def twice"));
                }
                symbolMap.typeMap.add(currentClass);
                currentClassType = new VariableType(currentClass,0,false);
                classMember.put(currentClass,new HashMap<String, Variable>());
                classMemberIndex.put(currentClass,new HashMap<Variable,Integer>());
                classDefinition((MxstarParser.ClassDefinitionContext)child);
                currentClass="";
            }
        }

        for(ParseTree child : ctx.children){
            if(child.getClass().equals(MxstarParser.FunctionDefinitionContext.class)){
                MxstarParser.FunctionDefinitionContext childContext =((MxstarParser.FunctionDefinitionContext)(Object)child);
                String name = childContext.functionName().getText();
                symbolMap.usedName.add(name);
            }
        }


        for(ParseTree child : ctx.children){

        }

        IR globalVariableIR = new IR();
        globalVariableIR.push(new Quad(OpCode.label,"global_init"));
        globalVariableIR.push(new Quad(OpCode.enterFunction,"global_init"));


        for(ParseTree child : ctx.children){


            if(child.getClass().equals(MxstarParser.FunctionDefinitionContext.class)){
                MxstarParser.FunctionDefinitionContext childContext =((MxstarParser.FunctionDefinitionContext)(Object)child);
                String name=childContext.functionName().getText();
                symbolMap.nextScope();
                symbolMap.currentFunction=name;
                VariableType returnType=VariableType.toVariableType(childContext.variableType());
                //if(returnType.name.equals("void"))
                //    returnType=VariableType.INT;
                ArrayList<VariableType>parameterList = new ArrayList<VariableType>();
                if(childContext.parameterList()!=null) {
                    for (int i = 0; i < childContext.parameterList().parameter().size(); i++) {
                        String variableName = childContext.parameterList().parameter(i).variableName().getText();
                        VariableType variableType = VariableType.toVariableType(childContext.parameterList().parameter(i).variableType());
                        parameterList.add(variableType);
                    }
                }
                Function function=new Function(name,returnType,parameterList);
                symbolMap.functionMap.put(name,function);

                /*if(childContext.parameterList()!=null) {
                    for (int i = 0; i < childContext.parameterList().parameter().size(); i++) {
                        String variableName = childContext.parameterList().parameter(i).variableName().getText();
                        VariableType variableType = VariableType.toVariableType(childContext.parameterList().parameter(i).variableType());
                        symbolMap.putSymbol(variableName, variableType);
                    }
                }*/
                 symbolMap.prevScope();
            }
        }

        boolean hasMain=false;
        for(ParseTree child : ctx.children){
            if(child.getClass().equals(MxstarParser.ClassDefinitionContext.class)){
                //System.out.println("Class");
                classIR.concat(visit(child));
            }
            if(child.getClass().equals(MxstarParser.GlobalVariableDefinitionContext.class)){
                //System.out.println("Variable");
                Variable.isGlobal=true;
                symbolMap.global=true;
                globalVariableIR.concat(visit(child));
                Variable.isGlobal=false;
                symbolMap.global=false;
            }
            if(child.getClass().equals(MxstarParser.FunctionDefinitionContext.class)){
                MxstarParser.FunctionDefinitionContext childContext =((MxstarParser.FunctionDefinitionContext)(Object)child);
                String name = childContext.functionName().getText();
                if(name.equals("main")) {
                    hasMain=true;
                    symbolMap.nextScope();
                    mainIR.concat(visit(child));
                    symbolMap.prevScope();
                    continue;
                }
               // System.out.println("Function");
                symbolMap.nextScope();
                IR tmpIR=visit(child);
                funcIR.put(name,tmpIR.clone());
                functionIR.concat(tmpIR);
                symbolMap.prevScope();
            }
        }

        if(!hasMain){
            System.err.println("no main function!");
            ir.push(Quad.quadError("no main function!"));
        }


        /*for(ParseTree child : ctx.children){
            if(child.getClass().equals(MxstarParser.FunctionDefinitionContext.class)){
                MxstarParser.FunctionDefinitionContext childContext =((MxstarParser.FunctionDefinitionContext)(Object)child);
                String name = childContext.functionName().getText();
                if(!name.equals("main"))
                    continue;
                //System.out.println("Function");
                symbolMap.nextScope();
                mainIR.concat(visit(child));
                symbolMap.prevScope();
            }
        }*/
        globalVariableIR.push(new Quad(OpCode.exitFunction));
        Quad quad=new Quad(OpCode.ret,nextConst(0,VariableType.INT),Variable.empty,Variable.empty);
        quad.name=symbolMap.currentFunction;
        globalVariableIR.push(quad);

        //ir.concat(mainIR);


        ir.concat(classIR);
        funcIR.put("main",mainIR);
        functionIR=IROptimize();
        ir.concat(functionIR);
        ir.concat(globalVariableIR);

        return ir;
    }



    @Override public IR visitClassDefinition(MxstarParser.ClassDefinitionContext ctx) {
        IR ir=new IR();
        currentClass=ctx.className().getText();
        currentClassType = new VariableType(currentClass,0,false);
        symbolMap.nextScope();
        ir.concat(visit(ctx.classBody()));
        symbolMap.prevScope();
        currentClass="";
        return ir;
    }
    //memberDefinition
    void classDefinition(MxstarParser.ClassDefinitionContext ctx){
        symbolMap.nextScope();
        for(ParseTree child : ctx.classBody().children) {
            if (child.getClass().equals(MxstarParser.MemberDefinitionContext.class)) {
                memberDefinition((MxstarParser.MemberDefinitionContext) child);
            }
        }
        for(ParseTree child : ctx.classBody().children) {
            if (child.getClass().equals(MxstarParser.MethodDefinitionContext.class)) {
                MxstarParser.MethodDefinitionContext context=((MxstarParser.MethodDefinitionContext)child);
                String name=currentClass+"_"+context.functionName().getText();
                symbolMap.currentFunction=name;
                VariableType returnType=VariableType.INT;
                if(context.variableType()!=null)
                    returnType=VariableType.toVariableType(context.variableType());
                else{//is construct function
                    if(!context.functionName().getText().equals(currentClass)){
                        System.err.println("construct function name incorrect");
                    }
                }
                ArrayList<VariableType>parameterList = new ArrayList<VariableType>();

                Variable methodThis=nextThis(currentClassType);
                currentThis=methodThis;
                if(context.parameterList()!=null) {
                    for (int i = 0; i < context.parameterList().parameter().size(); i++) {
                        String variableName = context.parameterList().parameter(i).variableName().getText();
                        VariableType variableType = VariableType.toVariableType(context.parameterList().parameter(i).variableType());
                        //symbolMap.putSymbol(variableName, variableType);

                        parameterList.add(variableType);

                    }
                }
                Function function=new Function(name,returnType,parameterList);
                symbolMap.functionMap.put(name,function);
            }
        }
        symbolMap.prevScope();
    }
    @Override public IR visitClassBody(MxstarParser.ClassBodyContext ctx) {
        IR ir = new IR();

        IR member=new IR();
        IR method=new IR();
        for(ParseTree child : ctx.children) {
            if (child.getClass().equals(MxstarParser.MemberDefinitionContext.class)) {
                //visit(child);
            }
        }
        for(ParseTree child : ctx.children) {
            if (child.getClass().equals(MxstarParser.MethodDefinitionContext.class)) {
                MxstarParser.MethodDefinitionContext context=((MxstarParser.MethodDefinitionContext)child);
                String name=currentClass+"_"+context.functionName().getText();
                symbolMap.currentFunction=name;
                VariableType returnType=VariableType.INT;
                if(context.variableType()!=null)
                    returnType=VariableType.toVariableType(context.variableType());
                else{//is construct function
                    if(!context.functionName().getText().equals(currentClass)){
                        System.err.println("construct function name incorrect");
                        ir.push(Quad.quadError("construct function name incorrect"));
                    }
                }
                ArrayList<VariableType>parameterList = new ArrayList<VariableType>();

                if(!symbolMap.typeMap.contains(returnType.name)){
                    System.err.println("Type not found 1");
                    ir.push(Quad.quadError("Type not found 1"));
                }
                Variable methodThis=nextThis(currentClassType);
                currentThis=methodThis;
                if(context.parameterList()!=null) {
                    for (int i = 0; i < context.parameterList().parameter().size(); i++) {
                        String variableName = context.parameterList().parameter(i).variableName().getText();
                        VariableType variableType = VariableType.toVariableType(context.parameterList().parameter(i).variableType());
                        //symbolMap.putSymbol(variableName, variableType);

                        if(!symbolMap.typeMap.contains(variableType.name)){
                            System.err.println("Type not found 2");
                            ir.push(Quad.quadError("Type not found 2"));
                        }
                        parameterList.add(variableType);

                    }
                }
                Function function=new Function(name,returnType,parameterList);
                //symbolMap.functionMap.put(name,function);
            }
        }


        for(ParseTree child : ctx.children) {
            if (child.getClass().equals(MxstarParser.MethodDefinitionContext.class)) {
                ir.concat(visit(child));
            }
        }

        /*for(int i=0;i<ctx.getChildCount();i++){
            ir.concat(visit(ctx.getChild(i)));
        }*/
        return ir;
    }

    @Override public IR visitMemberDefinition(MxstarParser.MemberDefinitionContext ctx) {
        IR ir = new IR();
        symbolMap.putSymbol(ctx.variableName().getText(),VariableType.toVariableType(ctx.variableType()));
        Variable variable = new Variable(ctx.variableName().getText(),VariableType.toVariableType(ctx.variableType()));
        HashMap<Variable,Integer> hashMap=classMemberIndex.get(currentClass);
        hashMap.put(variable,hashMap.size());

        HashMap<String,Variable> hashMap2=classMember.get(currentClass);
        hashMap2.put(variable.name,variable);
        return ir;
    }
    void memberDefinition(MxstarParser.MemberDefinitionContext ctx) {
        symbolMap.putSymbol(ctx.variableName().getText(),VariableType.toVariableType(ctx.variableType()));
        Variable variable = new Variable(ctx.variableName().getText(),VariableType.toVariableType(ctx.variableType()));
        HashMap<Variable,Integer> hashMap=classMemberIndex.get(currentClass);
        hashMap.put(variable,hashMap.size());

        HashMap<String,Variable> hashMap2=classMember.get(currentClass);
        hashMap2.put(variable.name,variable);
    }
    @Override public IR visitMethodDefinition(MxstarParser.MethodDefinitionContext ctx) {
        symbolMap.nextScope();
        IR ir = new IR();
        String name=currentClass+"_"+ctx.functionName().getText();
        symbolMap.currentFunction=name;
        VariableType returnType=VariableType.INT;
        if(ctx.variableType()!=null)
            returnType=VariableType.toVariableType(ctx.variableType());
        else{//is construct function
            if(!ctx.functionName().getText().equals(currentClass)){
                System.err.println("construct function name incorrect");
                ir.push(Quad.quadError("construct function name incorrect"));
            }
            returnType=VariableType.VOID;
        }
        ArrayList<VariableType>parameterList = new ArrayList<VariableType>();

        if(!symbolMap.typeMap.contains(returnType.name)){
            System.err.println("Type not found 1");
            ir.push(Quad.quadError("Type not found 1"));
        }
        Variable methodThis=nextThis(currentClassType);
        currentThis=methodThis;
        if(ctx.parameterList()!=null) {
            for (int i = 0; i < ctx.parameterList().parameter().size(); i++) {
                String variableName = ctx.parameterList().parameter(i).variableName().getText();
                VariableType variableType = VariableType.toVariableType(ctx.parameterList().parameter(i).variableType());
                symbolMap.putSymbol(variableName, variableType);

                if(!symbolMap.typeMap.contains(variableType.name)){
                    System.err.println("Type not found 2");
                    ir.push(Quad.quadError("Type not found 2"));
                }
                parameterList.add(variableType);

            }
        }
        Function function=new Function(name,returnType,parameterList);
        //symbolMap.functionMap.put(name,function);

        currentReturnType=returnType;
        IR stmt=visit(ctx.block());
        currentReturnType=null;


        ir.push(new Quad(OpCode.label,name));
        ir.push(new Quad(OpCode.enterFunction,name));
        ir.push(new Quad(OpCode.move, argList.get(63), Variable.empty, methodThis));
        if(name.equals("main"))
            ir.push(new Quad(OpCode.call,"global_init",nextVariable(VariableType.INT)));
        if(ctx.parameterList()!=null) {
            for (int i = 0; i < ctx.parameterList().parameter().size(); i++) {
                String variableName = ctx.parameterList().parameter(i).variableName().getText();
                String newName = symbolMap.renameMap.get(variableName);
                ir.push(new Quad(OpCode.move, argList.get(i), Variable.empty, new Variable(newName, parameterList.get(i))));
                //ir.push(new Quad(OpCode.pop, Variable.empty, Variable.empty, new Variable(newName, parameterList.get(i))));
            }
        }

        ir.concat(stmt);
        //ir.push(new Quad(OpCode.push, nextConst(0, VariableType.CONST_INT), Variable.empty, Variable.empty));
        if(returnType.equals(VariableType.VOID)){
            Quad quad =new Quad(OpCode.ret, nextVariable(VariableType.VOID), Variable.empty, Variable.empty);
            quad.name=function.name;
            ir.push(quad);
        }else{
            Quad quad =new Quad(OpCode.ret, nextConst(0, VariableType.CONST_INT), Variable.empty, Variable.empty);
            quad.name=function.name;
            ir.push(quad);
        }
        ir.push(new Quad(OpCode.exitFunction,name));

        //ir.modify_context(symbolMap.globalVariableMap);

        symbolMap.prevScope();
        symbolMap.currentFunction="";
        return ir;

/*        symbolMap.nextScope();
        IR ir = new IR();
        String name=ctx.functionName().getText();
        symbolMap.currentFunction=name;
        VariableType returnType=ctx.variableType()==null ? VariableType.INT :VariableType.toVariableType(ctx.variableType());
        ArrayList<VariableType>parameterList = new ArrayList<VariableType>();
        parameterList.add(VariableType.INT);

        //methodSelf.put();
        if(ctx.parameterList()!=null) {
            for (int i = 0; i < ctx.parameterList().parameter().size(); i++) {
                String variableName = ctx.parameterList().parameter(i).variableName().getText();
                VariableType variableType = VariableType.toVariableType(ctx.parameterList().parameter(i).variableType());
                symbolMap.putSymbol(variableName, variableType);
                parameterList.add(variableType);

            }
        }
        Function function=new Function(name,returnType,parameterList);
        symbolMap.functionMap.put(name,function);


        IR stmt=visit(ctx.block());


        ir.push(new Quad(OpCode.label,name));

        ir.push(new Quad(OpCode.move, argList.get(63), Variable.empty, methodThis));
        if(ctx.parameterList()!=null) {
            for (int i = 0; i < ctx.parameterList().parameter().size(); i++) {
                String variableName = ctx.parameterList().parameter(i).variableName().getText();
                String newName = symbolMap.renameMap.get(variableName);
                ir.push(new Quad(OpCode.move, argList.get(i), Variable.empty, new Variable(newName, parameterList.get(i))));
                //ir.push(new Quad(OpCode.pop, Variable.empty, Variable.empty, new Variable(newName, parameterList.get(i+1))));

            }
        }

        ir.concat(stmt);
        //ir.push(new Quad(OpCode.push,nextConst(0,VariableType.CONST_INT),Variable.empty,Variable.empty));
        ir.push(new Quad(OpCode.ret,nextConst(0,VariableType.INT),Variable.empty,Variable.empty));

        //ir.modify_context(symbolMap.globalVariableMap);

        symbolMap.prevScope();
        symbolMap.currentFunction="";
        currentThis=null;
        return ir;*/
    }

    @Override public IR visitMethodCall(MxstarParser.MethodCallContext ctx) {
        IR ir=new IR();


        /*if(!recursionVisitor.isSafe(symbolMap.currentFunction,functionName)
                &&function!=null && symbolMap.localVariable.get(symbolMap.currentFunction)!=null ){
            local = (ArrayList<String>) symbolMap.localVariable.get(symbolMap.currentFunction).clone();
            ir.push(new Quad(OpCode.saveContext));
            for(String variable : local){
                // ir.push(new Quad(OpCode.push,new Variable(variable,VariableType.INT),Variable.empty,Variable.empty));
            }
            ir.push(new Quad(OpCode.endContext));
        }*/
        IR left=visit(ctx.pointerValue());

        String functionName=ctx.functionName().getText();
        Function function=symbolMap.functionMap.get(left.last.dest.type.name+"_"+functionName);

        ArrayList<String> local = null;


        ir.concat(left);
        IR exp=new IR();
        if(ctx.expressionList()!=null) {
            exp=visit(ctx.expressionList());
            ir.concat(exp);
        }
        ir.push(new Quad(OpCode.move,left.last.dest,Variable.empty,argList.get(63)));

        Variable returnTemp=nextConst(0,VariableType.CONST_INT);
        if(function!=null) {
            returnTemp=nextVariable(function.returnType);
            ir.push(new Quad(OpCode.call, function.name,returnTemp));
        }else{

            Variable temp = nextVariable(VariableType.STRING);
            Variable tmp = nextVariable(VariableType.INT);
            switch (functionName){
                case "parseInt":

                    ir.push(new Quad(OpCode.parseInt,Variable.empty,Variable.empty,nextVariable(VariableType.INT)));
                    break;
                case "substring":
                    ir.push(new Quad(OpCode.substring,argList.get(0),argList.get(1),nextVariable(VariableType.STRING)));
                    break;
                case "ord":
                    ir.push(new Quad(OpCode.ord,argList.get(0),Variable.empty,nextVariable(VariableType.INT)));
                    break;
                case "size":
                    ir.push(new Quad(OpCode.move,argList.get(63),Variable.empty,tmp));
                    ir.push(new Quad(OpCode.load,tmp,Variable.empty,tmp));
                    break;
                case "length":
                    ir.push(new Quad(OpCode.move,argList.get(63),Variable.empty,tmp));
                    ir.push(new Quad(OpCode.load,tmp,Variable.empty,tmp));
                    ir.push(new Quad(OpCode.and,tmp,nextConst(255,VariableType.CONST_INT),tmp));
                    break;
                default:
                    ir.push(Quad.quadError("methodCall Error"));
            }
        }

        if(!recursionVisitor.isSafe(symbolMap.currentFunction,functionName)
                &&function!=null && local !=null){
            ir.push(new Quad(OpCode.resumeContext));
            for(int i=local.size()-1;i>=0;i--){
                String variable = local.get(i);
                //ir.push(new Quad(OpCode.pop,Variable.empty,Variable.empty,new Variable(variable,VariableType.INT)));
            }
            ir.push(new Quad(OpCode.endContext));
            ir.push(new Quad(OpCode.move,returnTemp,Variable.empty,returnTemp));
        }

        return ir;
    }

    /*@Override public IR visitMethodCallWithExp(MxstarParser.MethodCallWithExpContext ctx) {
        IR ir=new IR();

        ArrayList<String> local = null;



        IR left=visit(ctx.expression());
        String functionName=ctx.functionName().getText();
        Function function=symbolMap.functionMap.get(left.last.dest.type.name+"_"+functionName);
        ir.concat(left);
        if(ctx.expressionList()!=null) {
            ir.concat(visit(ctx.expressionList()));
        }
        ir.push(new Quad(OpCode.move,left.last.dest,Variable.empty,argList.get(63)));

        Variable returnTemp=nextConst(0,VariableType.CONST_INT);
        if(function!=null) {
            returnTemp=nextVariable(function.returnType);
            ir.push(new Quad(OpCode.call, function.name,returnTemp));
        }else{

            Variable temp = nextVariable(VariableType.STRING);
            Variable tmp = nextVariable(VariableType.INT);
            switch (functionName){
                case "parseInt"://TODO
                    ir.push(new Quad(OpCode.getInt,Variable.empty,Variable.empty,nextVariable(VariableType.INT)));
                    break;
                case "substring"://TODO
                    ir.push(new Quad(OpCode.getString,Variable.empty,Variable.empty,nextVariable(VariableType.STRING)));
                    break;
                case "ord"://TODO
                    ir.push(new Quad(OpCode.pop,Variable.empty,Variable.empty,temp));
                    ir.push(new Quad(OpCode.print,temp,Variable.empty,Variable.empty));
                    break;
                case "size":
                    ir.push(new Quad(OpCode.move,argList.get(63),Variable.empty,tmp));
                    ir.push(new Quad(OpCode.load,tmp,Variable.empty,tmp));
                    break;
                case "length":
                    ir.push(new Quad(OpCode.move,argList.get(63),Variable.empty,tmp));
                    ir.push(new Quad(OpCode.load,tmp,Variable.empty,tmp));
                    ir.push(new Quad(OpCode.and,tmp,nextConst(255,VariableType.CONST_INT),tmp));
                    break;
                default:
                    ir.push(Quad.quadError("methodCall Error"));
            }
        }

        ir.push(new Quad(OpCode.move,returnTemp,Variable.empty,returnTemp));


        return ir;
    }
*/


    @Override public IR visitDotExpression(MxstarParser.DotExpressionContext ctx) {
        IR ir = new IR();
        String startName=ctx.variable(0).variableName().getText();
        if(startName.equals("this"))
            startName=currentThis.name;
        VariableType startType = symbolMap.getVariable(startName);
        if(startType==null){
            startType=classMember.get(currentClass).get(startName).type;
        }
        Variable start = nextVariable(startType.clone());
        Variable adr=nextVariable(VariableType.INT);

        start.name=symbolMap.renameMap.get(startName);
        Variable cur = nextVariable(startType.clone());

        Variable arr = nextVariable(VariableType.INT);
        Variable head = nextVariable(VariableType.INT);
        //ir.push(new Quad(OpCode.mallocArray,));
        IR accIR = new IR(),tmp=new IR();
        int size=0;
        for(int i=0;i<ctx.variable().size();i++){
            if(ctx.variable(i).index()!=null)
                size+=ctx.variable(i).index().size();
            size++;
        }
        size--;
        int curs=0;
        ir.push(new Quad(OpCode.mallocArray,nextConst(size,VariableType.CONST_INT),Variable.empty,arr));
        ir.push(new Quad(OpCode.move,arr,Variable.empty,head));
        for(int i=0;i<ctx.variable().size();i++){

            if(i==0){

            }else{
                String name=ctx.variable(i).variableName().getText();
                Variable variable=classMember.get(cur.type.name).get(name);
                Variable idx = nextConst(classMemberIndex.get(cur.type.name).get(variable),VariableType.CONST_INT);
                accIR.push(new Quad(OpCode.address,arr,nextConst(curs,VariableType.CONST_INT),head));
                curs++;
                accIR.push(new Quad(OpCode.store,idx,Variable.empty,head));
                cur.type=variable.type.clone();
            }
            if(ctx.variable(i).index()!=null)
                for(int j=0;j<ctx.variable(i).index().size();j++){
                    tmp=visit(ctx.variable(i).index(j));
                    ir.concat(tmp);
                    accIR.push(new Quad(OpCode.address,arr,nextConst(curs,VariableType.CONST_INT),head));
                    curs++;
                    accIR.push(new Quad(OpCode.store,tmp.last.dest,Variable.empty,head));
                    cur.type.level--;
                }
        }
        Variable result=nextVariable(cur.type);
        accIR.push(new Quad(OpCode.multiAddress,start,arr,result));
        ir.concat(accIR);
        ir.push(new Quad(OpCode.load,result,Variable.empty,result));

        return ir;
    }
    @Override public IR visitHyperDotExpression(MxstarParser.HyperDotExpressionContext ctx) {
        IR ir = new IR();

        IR exp=visit(ctx.expression());

        ir.concat(exp);
        Variable start=exp.last.dest;
        for(int i=0;i<ctx.dotAtom().size();i++){
            if(ctx.dotAtom(i).functionName()==null){//variable
                //TODO
            }else{//function
                String functionName=ctx.dotAtom(i).functionName().getText();
                IR expList=new IR();
                if(ctx.dotAtom(i).expressionList()!=null)
                    expList=visit(ctx.dotAtom(i).expressionList());
                ir.concat(expList);
                ir.push(new Quad(OpCode.move,start,Variable.empty,argList.get(63)));
                Function function=symbolMap.functionMap.get(start.type.name+"_"+functionName);

                if(function==null){
                    Variable temp = nextVariable(VariableType.STRING);
                    Variable tmp = nextVariable(VariableType.INT);
                    Variable retString = nextVariable(VariableType.STRING);
                    Variable retInt = nextVariable(VariableType.INT);
                    switch (functionName){
                        case "parseInt":
                            ir.push(new Quad(OpCode.parseInt,Variable.empty,Variable.empty,retInt));
                            ir.push(new Quad(OpCode.move,retInt,Variable.empty,start));
                            start.type=retInt.type.clone();
                            break;
                        case "substring":
                            ir.push(new Quad(OpCode.substring,argList.get(0),argList.get(1),retString));
                            ir.push(new Quad(OpCode.move,retString,Variable.empty,start));
                            start.type=retString.type.clone();
                            break;
                        case "ord":
                            ir.push(new Quad(OpCode.ord,argList.get(0),Variable.empty,retInt));
                            ir.push(new Quad(OpCode.move,retInt,Variable.empty,start));
                            start.type=retInt.type.clone();
                            break;
                        case "size":
                            ir.push(new Quad(OpCode.move,argList.get(63),Variable.empty,tmp));
                            ir.push(new Quad(OpCode.load,tmp,Variable.empty,retInt));
                            ir.push(new Quad(OpCode.move,retInt,Variable.empty,start));
                            start.type=retInt.type.clone();
                            break;
                        case "length":
                            ir.push(new Quad(OpCode.move,argList.get(63),Variable.empty,tmp));
                            ir.push(new Quad(OpCode.load,tmp,Variable.empty,tmp));
                            ir.push(new Quad(OpCode.and,tmp,nextConst(255,VariableType.CONST_INT),retInt));
                            ir.push(new Quad(OpCode.move,retInt,Variable.empty,start));
                            start.type=retInt.type.clone();
                            break;
                        default:
                            ir.push(Quad.quadError("hypermethodCall Error"));
                    }
                }else{
                    Variable ret=nextVariable(function.returnType);
                    ir.push(new Quad(OpCode.call,start.type.name+"_"+functionName,ret));
                    ir.push(new Quad(OpCode.move,ret,Variable.empty,start));
                    start.type=ret.type.clone();
                }

            }
        }

        return ir;
    }

    @Override public IR visitNewVariable(MxstarParser.NewVariableContext ctx) {
        IR ir = new IR();
        VariableType variableType = VariableType.toVariableType(ctx.variableBasicType());
        Variable temp = nextVariable(VariableType.toVariableType(ctx.variableBasicType()));
        temp.isTemp=true;
        if(variableType.name.equals("int") || variableType.name.contains("bool"))
            ir.push(new Quad(OpCode.malloc,nextConst(8,VariableType.CONST_INT),Variable.empty,temp));
        else {
            int size=classMember.get(variableType.name).size();
            ir.push(new Quad(OpCode.mallocArray,nextConst(size,VariableType.CONST_INT), Variable.empty, temp));
            //TODO with out construct function
        }
        return ir;
    }
    @Override public IR visitNewVariableWithoutExp(MxstarParser.NewVariableWithoutExpContext ctx) {
        IR ir = new IR();
        VariableType variableType = VariableType.toVariableType(ctx.variableBasicType());
        Variable temp = nextVariable(VariableType.toVariableType(ctx.variableBasicType()));
        temp.isTemp=true;
        if(variableType.name.equals("int") || variableType.name.contains("bool"))
            ir.push(new Quad(OpCode.malloc,nextConst(8,VariableType.CONST_INT),Variable.empty,temp));
        else {
            int size=classMember.get(variableType.name).size();
            ir.push(new Quad(OpCode.mallocArray,nextConst(size,VariableType.CONST_INT), Variable.empty, temp));
            //TODO with out construct function
        }
        return ir;
    }

    @Override public IR visitPointerValue(MxstarParser.PointerValueContext ctx) {
        IR ir = new IR();
        String startName=ctx.variable(0).variableName().getText();
        if(startName.equals("this"))
            startName=currentThis.name;
        VariableType startType = symbolMap.getVariable(startName);
        if(startType==null){
            startType=classMember.get(currentClass).get(startName).type;
        }
        Variable start = nextVariable(startType.clone());
        Variable adr=nextVariable(VariableType.INT);
        ir.push(new Quad(OpCode.move,new Variable(symbolMap.renameMap.get(startName),startType),Variable.empty,start));
        ArrayList<IR> parameterList = new ArrayList<IR>();

        for(int i=0;i<ctx.variable(0).index().size();i++){
            parameterList.add(visit(ctx.variable(0).index(i).expression()));
            ir.concat(parameterList.get(i));
        }
        int used=0;
        for(int i=0;i<parameterList.size();i++){
            ir.push(new Quad(OpCode.address,start,parameterList.get(i).last.dest,adr));
            //if((++used) < parameterList.size())
            ir.push(new Quad(OpCode.load,adr,Variable.empty,start));
            start.type.level--;
        }

        for(int i=1;i<ctx.variable().size();i++){
            String name=ctx.variable(i).variableName().getText();
            Variable variable=classMember.get(start.type.name).get(name);
            Variable idx = nextConst(classMemberIndex.get(start.type.name).get(variable),VariableType.CONST_INT);

            ir.push(new Quad(OpCode.address,start,idx,adr));
            ir.push(new Quad(OpCode.load,adr,Variable.empty,start));
            start.type=variable.type.clone();

            parameterList.clear();
            for(int j=0;j<ctx.variable(i).index().size();j++){
                parameterList.add(visit(ctx.variable(i).index(j).expression()));
                ir.concat(parameterList.get(j));
            }
            used=0;
            for(int j=0;j<parameterList.size();j++){
                ir.push(new Quad(OpCode.address,start,parameterList.get(j).last.dest,adr));
                //if((++used) < parameterList.size())
                ir.push(new Quad(OpCode.load,adr,Variable.empty,start));
                start.type.level--;
            }
        }
        ir.push(new Quad(OpCode.move,start,Variable.empty,start));


        return ir;
    }
    @Override public IR visitLeftValue(MxstarParser.LeftValueContext ctx) {
        IR ir = new IR();
        String startName=ctx.variable(0).variableName().getText();
        if(startName.equals("this"))
            startName=currentThis.name;
        VariableType startType = symbolMap.getVariable(startName);
        boolean hiddenThis=false;
        if(startType==null){
            startType=classMember.get(currentClass).get(startName).type;
            hiddenThis=true;
        }
        Variable start = nextVariable(startType.clone());
        start.name=startName;
        Variable cur = nextVariable(startType.clone());
        Variable adr=nextVariable(VariableType.INT);

        if(hiddenThis){
            int ind=classMemberIndex.get(currentClass).get(start);
            ir.push(new Quad(OpCode.address,currentThis,nextConst(ind,VariableType.CONST_INT),start));
        }

        Variable arr = nextVariable(VariableType.INT);
        Variable head = nextVariable(VariableType.INT);
        //ir.push(new Quad(OpCode.mallocArray,));
        IR accIR = new IR(),tmp=new IR();
        int size=0;
        for(int i=0;i<ctx.variable().size();i++){
            if(ctx.variable(i).index()!=null)
                size+=ctx.variable(i).index().size();
            size++;
        }
        size--;
        int curs=0;
        ir.push(new Quad(OpCode.mallocArray,nextConst(size,VariableType.CONST_INT),Variable.empty,arr));
        ir.push(new Quad(OpCode.move,arr,Variable.empty,head));
        for(int i=0;i<ctx.variable().size();i++){

            if(i==0){

            }else{
                String name=ctx.variable(i).variableName().getText();
                Variable variable=classMember.get(cur.type.name).get(name);
                Variable idx = nextConst(classMemberIndex.get(cur.type.name).get(variable),VariableType.CONST_INT);
                accIR.push(new Quad(OpCode.address,arr,nextConst(curs,VariableType.CONST_INT),head));
                curs++;
                accIR.push(new Quad(OpCode.store,idx,Variable.empty,head));
                cur.type=variable.type.clone();
            }
            if(ctx.variable(i).index()!=null)
            for(int j=0;j<ctx.variable(i).index().size();j++){
                tmp=visit(ctx.variable(i).index(j));
                ir.concat(tmp);
                accIR.push(new Quad(OpCode.address,arr,nextConst(curs,VariableType.CONST_INT),head));
                curs++;
                accIR.push(new Quad(OpCode.store,tmp.last.dest,Variable.empty,head));
                cur.type.level--;
            }
        }
        Variable result=nextVariable(cur.type);
        accIR.push(new Quad(OpCode.multiAddress,start,arr,result));
        ir.concat(accIR);

/*        ir.push(new Quad(OpCode.move,new Variable(symbolMap.renameMap.get(startName),startType),Variable.empty,start));
        ArrayList<IR> parameterList = new ArrayList<IR>();

        for(int i=0;i<ctx.variable(0).index().size();i++){
            parameterList.add(visit(ctx.variable(0).index(i).expression()));
            ir.concat(parameterList.get(i));
        }
        int used=0;
        for(int i=0;i<parameterList.size();i++){
            ir.push(new Quad(OpCode.address,start,parameterList.get(i).last.dest,adr));
            //if((++used) < parameterList.size())
                ir.push(new Quad(OpCode.load,adr,Variable.empty,start));
            start.type.level--;
        }

        for(int i=1;i<ctx.variable().size();i++){
            String name=ctx.variable(i).variableName().getText();
            Variable variable=classMember.get(start.type.name).get(name);
            Variable idx = nextConst(classMemberIndex.get(start.type.name).get(variable),VariableType.CONST_INT);

            ir.push(new Quad(OpCode.address,start,idx,adr));
            ir.push(new Quad(OpCode.load,adr,Variable.empty,start));
            start.type=variable.type.clone();

            parameterList.clear();
            for(int j=0;j<ctx.variable(i).index().size();j++){
                parameterList.add(visit(ctx.variable(i).index(j).expression()));
                ir.concat(parameterList.get(j));
            }
            used=0;
            for(int j=0;j<parameterList.size();j++){
                ir.push(new Quad(OpCode.address,start,parameterList.get(j).last.dest,adr));
                //if((++used) < parameterList.size())
                    ir.push(new Quad(OpCode.load,adr,Variable.empty,start));
                start.type.level--;
            }
        }
        ir.push(new Quad(OpCode.move,adr,Variable.empty,adr));

*/
        return ir;
    }


    IR getAddress(String variableName,ArrayList<IR> parameterList){
        IR ir = new IR();


        VariableType variableType = symbolMap.getVariable(variableName);
        if(variableType==null) {
            variableType=classMember.get(currentClass).get(variableName).type;
        }
        if(variableType==null) {
            ir.push(Quad.quadError("Symbol not found"));
            return ir;
        }

        Variable variable = new Variable(symbolMap.renameMap.get(variableName),variableType);
        if(parameterList.size()==0){
           ir.push(new Quad(OpCode.move,variable,Variable.empty,variable));
        }else{
            for(IR tmpIR : parameterList){
                Variable dest=tmpIR.last.dest;
                if(!dest.type.equals(VariableType.INT) && !dest.type.equals(VariableType.CONST_INT)){
                    ir.push(Quad.quadError("ArrayIndex is not an integer."));
                    return ir;
                }
                ir.concat(tmpIR);
            }

            Variable adr = nextVariable(VariableType.INT);
            Variable start = nextVariable(variableType.clone());
            ir.push(new Quad(OpCode.move,variable,Variable.empty,start));
            int used=0;
            for(IR tmpIR : parameterList){
                Variable dest=tmpIR.last.dest;
                Quad quad5=null;
                if( (++used) < parameterList.size()) {
                    quad5 = new Quad(OpCode.load, adr, Variable.empty, start);
                }

                ir.push(new Quad(OpCode.address,start,dest,adr));
                ir.push(quad5);
                start.type.level--;
            }

            ir.push(new Quad(OpCode.move,adr,Variable.empty,adr));
        }
        return ir;

    }



    IR assign(String variableName,IR exp,ArrayList<IR> parameterList){
        IR ir = new IR();

        ir.concat(exp);

        VariableType variableType = symbolMap.getVariable(variableName);
        if(variableType==null) {
            variableType=classMember.get(currentClass).get(variableName).type;
        }
        if(variableType==null) {
            ir.push(Quad.quadError("Symbol not found"));
            return ir;
        }

        Variable variable = new Variable(symbolMap.renameMap.get(variableName),variableType);
        if(parameterList.size()==0){
            if(!variableType.match(exp.last.dest.type)){
                ir.push(Quad.quadError("Type did not match 1"));
                return ir;
            }
            ir.push(new Quad(OpCode.move,exp.last.dest,Variable.empty,variable));
        }else{
            for(IR tmpIR : parameterList){
                Variable dest=tmpIR.last.dest;
                if(!dest.type.equals(VariableType.INT) && !dest.type.equals(VariableType.CONST_INT)){
                    ir.push(Quad.quadError("ArrayIndex is not an integer."));
                    return ir;
                }
                ir.concat(tmpIR);
            }

            Variable adr = nextVariable(VariableType.INT);
            Variable start = nextVariable(variableType.clone());
            ir.push(new Quad(OpCode.move,variable,Variable.empty,start));
            int used=0;
            for(IR tmpIR : parameterList){
                Variable dest=tmpIR.last.dest;
                Quad quad5=null;
                if( (++used) < parameterList.size()) {
                    quad5 = new Quad(OpCode.load, adr, Variable.empty, start);
                }

                ir.push(new Quad(OpCode.address,start,dest,adr));
                ir.push(quad5);
                start.type.level--;
            }

            if(!start.type.match(exp.last.dest.type)){
                ir.push(Quad.quadError("Type did not match 2"));
                return ir;
            }
            ir.push(new Quad(OpCode.store,exp.last.dest,Variable.empty,adr));

            for(IR tmpIR : parameterList){
                Variable dest=tmpIR.last.dest;
            }
        }
        return ir;

    }


    @Override public IR visitAssign(MxstarParser.AssignContext ctx) {
        String variableName = ctx.leftValue().variable(0).variableName().getText();
        if(ctx.leftValue().variable().size()==1 && symbolMap.getVariable(variableName)!=null) {
            IR exp = visit(ctx.expression());
            ArrayList<IR> parameterList = new ArrayList<IR>();
            for (int i = 0; i < ctx.leftValue().variable(0).index().size(); i++) {
                parameterList.add(visit(ctx.leftValue().variable(0).index().get(i)));
            }
            return assign(variableName, exp, parameterList);
        }else{
            IR ir=new IR();
            IR left=visit(ctx.leftValue());
            IR exp=visit(ctx.expression());
            ir.concat(left);
            ir.concat(exp);
            ir.push(new Quad(OpCode.store,exp.last.dest,Variable.empty,left.last.dest));
            return ir;
        }
    }

    @Override public IR visitExpressionStatement(MxstarParser.ExpressionStatementContext ctx) {return visit(ctx.expression());}
    @Override public IR visitFunctionDefinition(MxstarParser.FunctionDefinitionContext ctx) {
        symbolMap.nextScope();
        IR ir = new IR();
        String name=ctx.functionName().getText();
        symbolMap.currentFunction=name;
        VariableType returnType=VariableType.toVariableType(ctx.variableType());
        if(!symbolMap.typeMap.contains(returnType.name)){
            System.err.println("Type not found 3");
            ir.push(Quad.quadError("Type not found 3"));
        }

        ArrayList<VariableType>parameterList = new ArrayList<VariableType>();
        if(ctx.parameterList()!=null) {
            for (int i = 0; i < ctx.parameterList().parameter().size(); i++) {
                String variableName = ctx.parameterList().parameter(i).variableName().getText();
                VariableType variableType = VariableType.toVariableType(ctx.parameterList().parameter(i).variableType());
                symbolMap.putSymbol(variableName, variableType);

                if(!symbolMap.typeMap.contains(variableType.name)){
                    System.err.println("Type not found 4");
                    ir.push(Quad.quadError("Type not found 4"));
                }
                parameterList.add(variableType);

            }
        }
        Function function=new Function(name,returnType,parameterList);
        //symbolMap.functionMap.put(name,function);

        currentReturnType=returnType;
        IR stmt=visit(ctx.functionBody());
        currentReturnType=null;

        ir.push(new Quad(OpCode.label,name));
        ir.push(new Quad(OpCode.enterFunction,name));
        if(name.equals("main")) {
            ir.push(new Quad(OpCode.call, "global_init", nextVariable(VariableType.INT)));
            if(!returnType.name.equals("int")){
                System.err.println("main must be int");
                ir.push(Quad.quadError("main must be int"));
            }
        }
        if(ctx.parameterList()!=null) {
            for (int i = 0; i < ctx.parameterList().parameter().size(); i++) {
                String variableName = ctx.parameterList().parameter(i).variableName().getText();
                String newName = symbolMap.renameMap.get(variableName);
                ir.push(new Quad(OpCode.move, argList.get(i), Variable.empty, new Variable(newName, parameterList.get(i))));
                //ir.push(new Quad(OpCode.pop, Variable.empty, Variable.empty, new Variable(newName, parameterList.get(i))));
            }
        }

        ir.concat(stmt);
        //ir.push(new Quad(OpCode.push, nextConst(0, VariableType.CONST_INT), Variable.empty, Variable.empty));
        Quad quad =new Quad(OpCode.ret, nextConst(0, VariableType.CONST_INT), Variable.empty, Variable.empty);
        quad.name=function.name;
        ir.push(quad);
        ir.push(new Quad(OpCode.exitFunction,name));

        //ir.modify_context(symbolMap.globalVariableMap);

        symbolMap.prevScope();
        symbolMap.currentFunction="";
        return ir;
    }



    @Override public IR visitBlock(MxstarParser.BlockContext ctx) {
        symbolMap.nextScope();
        IR ir = new IR();
        for(int i=0;i<ctx.getChildCount();i++){
            ir.concat(visit(ctx.getChild(i)));
        }
        symbolMap.prevScope();
        return ir;
    }

    @Override public IR visitFunctionBody(MxstarParser.FunctionBodyContext ctx) {
        //symbolMap.nextScope();
        IR ir = new IR();
        for(int i=0;i<ctx.getChildCount();i++){
            ir.concat(visit(ctx.getChild(i)));
        }
        //symbolMap.prevScope();
        return ir;
    }

    @Override public IR visitIfStatement(MxstarParser.IfStatementContext ctx) {
        IR ir = new IR();
        IR exp = visit(ctx.expression());

        ir.concat(exp);

        //if(!VariableType.BOOL.match(exp.last.dest.type))
        //    ir.push(Quad.quadError("exp must be bool if"));

        String falseLable=nextLabel();
        String outLable=nextLabel();

        if(ctx.elseBlock()!=null){
            symbolMap.nextScope();
            IR trueIR=visit(ctx.statementOrBlock());
            symbolMap.prevScope();
            symbolMap.nextScope();
            IR falseIR=visit(ctx.elseBlock().statementOrBlock());
            symbolMap.prevScope();

            Quad quad1=new Quad(OpCode.jz,exp.last.dest,Variable.empty,Variable.empty);
            quad1.name=falseLable;

            ir.push(quad1);
            ir.concat(trueIR);
            ir.push(new Quad(OpCode.jmp,outLable));
            ir.push(new Quad(OpCode.label,falseLable));
            ir.concat(falseIR);
            ir.push(new Quad(OpCode.label,outLable));


        }else{
            symbolMap.nextScope();
            IR trueIR=visit(ctx.statementOrBlock());
            symbolMap.prevScope();

            Quad quad1=new Quad(OpCode.jz,exp.last.dest,Variable.empty,Variable.empty);
            quad1.name=outLable;
            ir.push(quad1);
            ir.concat(trueIR);
            ir.push(new Quad(OpCode.label,outLable));
        }

        return ir;
    }
    @Override public IR visitWhileStatement(MxstarParser.WhileStatementContext ctx) {
        IR ir = new IR();
        String startLabel=nextLabel();
        String endLabel=nextLabel();
        currentStartLabel.push(startLabel);
        currentEndLabel.push(endLabel);
        currentAlmostEndLabel.push(startLabel);
        IR exp = visit(ctx.expression());
        symbolMap.nextScope();
        IR stmt = new IR();
        if(ctx.statementOrBlock()!=null)
            stmt=visit(ctx.statementOrBlock());
        symbolMap.prevScope();
        ir.push(new Quad(OpCode.label,startLabel));
        ir.concat(exp);
        if(!VariableType.BOOL.match(exp.last.dest.type))
            ir.push(Quad.quadError("exp must be bool while"));
        Quad quad = new Quad(OpCode.jz,exp.last.dest,Variable.empty,Variable.empty);
        quad.name=endLabel;
        ir.push(quad);
        ir.concat(stmt);
        ir.push(new Quad(OpCode.jmp,startLabel));
        ir.push(new Quad(OpCode.label,endLabel));
        currentStartLabel.pop();
        currentEndLabel.pop();
        currentAlmostEndLabel.pop();

        return ir;
    }
    @Override public IR visitForStatement(MxstarParser.ForStatementContext ctx) {
        IR ir = new IR();
        String startLabel=nextLabel();
        String endLabel=nextLabel();
        String almostEndLabel=nextLabel();
        currentStartLabel.push(startLabel);
        currentEndLabel.push(endLabel);
        currentAlmostEndLabel.push(almostEndLabel);


        IR A = null;
        IR B = null;
        IR C = null;
        if(ctx.A!=null)A=visit(ctx.A);
        if(ctx.B!=null)B=visit(ctx.B);
        if(ctx.C!=null)C=visit(ctx.C);
        symbolMap.nextScope();
        IR stmt = new IR();
        if(ctx.statementOrBlock()!=null)
            stmt=visit(ctx.statementOrBlock());
        else {
            stmt.push(new Quad(OpCode.jmp,endLabel));//TODO maybe wrong
        }
        symbolMap.prevScope();
        ir.concat(A);
        ir.push(new Quad(OpCode.label,startLabel));
        ir.concat(B);
        if(B!=null) {
            if(!VariableType.BOOL.match(B.last.dest.type))
                ir.push(Quad.quadError("exp must be bool for"));
            Quad quad = new Quad(OpCode.jz, B.last.dest, Variable.empty, Variable.empty);
            quad.name = endLabel;
            ir.push(quad);
        }else{

        }
        ir.concat(stmt);
        ir.push(new Quad(OpCode.label,almostEndLabel));
        ir.concat(C);
        ir.push(new Quad(OpCode.jmp,startLabel));
        ir.push(new Quad(OpCode.label,endLabel));


        currentStartLabel.pop();
        currentEndLabel.pop();
        currentAlmostEndLabel.pop();

        return ir;

    }

    @Override public IR visitReturnStatement(MxstarParser.ReturnStatementContext ctx) {
        IR ir = new IR();

        if(ctx.expression()==null){
            //ir.push(new Quad(OpCode.push,nextConst(0,VariableType.CONST_INT),Variable.empty,Variable.empty));
            Quad quad=new Quad(OpCode.ret,nextConst(0,VariableType.CONST_INT),Variable.empty,Variable.empty);
            quad.name=symbolMap.currentFunction;
            ir.push(quad);
        }else{
            ir.concat(visit(ctx.expression()));
            //ir.push(new Quad(OpCode.push,ir.last.dest,Variable.empty,Variable.empty));
            if(ir.last.dest.type.equals(VariableType.VOID)){
                System.err.println("No void");
                ir.push(Quad.quadError("No void"));
            }
            if(!currentReturnType.match(ir.last.dest.type)){
                System.err.println("return not match");
                ir.push(Quad.quadError("return not match"));
            }
            Quad quad=new Quad(OpCode.ret,ir.last.dest,Variable.empty,Variable.empty);
            quad.name=symbolMap.currentFunction;
            ir.push(quad);
        }

        return ir;
    }
    @Override public IR visitBreakStatement(MxstarParser.BreakStatementContext ctx) {
        IR ir = new IR();
        if(currentEndLabel.empty()){
            ir.push(Quad.quadError("Can not break"));
        }else{
            ir.push(new Quad(OpCode.jmp,currentEndLabel.peek()));
        }
        return ir;
    }
    @Override public IR visitContinueStatement(MxstarParser.ContinueStatementContext ctx) {
        IR ir = new IR();
        if(currentStartLabel.empty()){
            ir.push(Quad.quadError("Can not continue"));
        }else{
            ir.push(new Quad(OpCode.jmp,currentAlmostEndLabel.peek()));
        }
        return ir;
    }




    @Override public IR visitLogicOr(MxstarParser.LogicOrContext ctx) {
        IR ir = new IR();
        IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));

        String falseLabel=nextLabel();
        String endLabel=nextLabel();
        VariableType variableType=symbolMap.operate(ir0.last.dest.type,"||",ir1.last.dest.type);
        Variable temp=buildVariable(ir0.last.dest,"||",ir1.last.dest);


        ir.concat(ir0);
        Quad quad=new Quad(OpCode.jz,ir0.last.dest,Variable.empty,Variable.empty);
        quad.name=falseLabel;
        ir.push(quad);
        ir.push(new Quad(OpCode.move,nextConst(1,VariableType.CONST_BOOL),Variable.empty,temp));
        ir.push(new Quad(OpCode.jmp,endLabel));
        ir.push(new Quad(OpCode.label,falseLabel));
        ir.concat(ir1);
        ir.push(new Quad(OpCode.move,ir1.last.dest,Variable.empty,temp));
        ir.push(new Quad(OpCode.label,endLabel));
        ir.push(new Quad(OpCode.move,temp,Variable.empty,temp));
        return ir;
    }
    @Override public IR visitLogicAnd(MxstarParser.LogicAndContext ctx) {
        IR ir = new IR();
        IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));

        String trueLabel=nextLabel();
        String endLabel=nextLabel();
        Variable temp=buildVariable(ir0.last.dest,"&&",ir1.last.dest);
        temp.isTemp=true;
        ir.concat(ir0);
        Quad quad=new Quad(OpCode.jnz,ir0.last.dest,Variable.empty,Variable.empty);
        quad.name=trueLabel;
        ir.push(quad);
        ir.push(new Quad(OpCode.move,nextConst(0,VariableType.CONST_BOOL),Variable.empty,temp));
        ir.push(new Quad(OpCode.jmp,endLabel));
        ir.push(new Quad(OpCode.label,trueLabel));
        ir.concat(ir1);
        ir.push(new Quad(OpCode.move,ir1.last.dest,Variable.empty,temp));
        ir.push(new Quad(OpCode.label,endLabel));
        ir.push(new Quad(OpCode.move,temp,Variable.empty,temp));
        return ir;
    }
    @Override public IR visitRelationOperator(MxstarParser.RelationOperatorContext ctx) {
        IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));
        Variable temp=buildVariable(ir0.last.dest,ctx.op.getText(),ir1.last.dest);
        temp.isTemp=true;
        if(ir0.last.dest.type.name.contains("string")){
            OpCode opCode = OpCode.strless;
            if (ctx.op.getText().equals("<"))
                opCode = OpCode.strless;
            if (ctx.op.getText().equals("<="))
                opCode = OpCode.strleq;
            if (ctx.op.getText().equals(">"))
                opCode = OpCode.strgreater;
            if (ctx.op.getText().equals(">="))
                opCode = OpCode.strgeq;
            Quad quad = new Quad(opCode, ir0.last.dest, ir1.last.dest, temp);
            ir0.concat(ir1);
            ir0.push(quad);
        }else {
            OpCode opCode = OpCode.less;
            if (ctx.op.getText().equals("<"))
                opCode = OpCode.less;
            if (ctx.op.getText().equals("<="))
                opCode = OpCode.leq;
            if (ctx.op.getText().equals(">"))
                opCode = OpCode.greater;
            if (ctx.op.getText().equals(">="))
                opCode = OpCode.geq;
            Quad quad = new Quad(opCode, ir0.last.dest, ir1.last.dest, temp);
            ir0.concat(ir1);
            ir0.push(quad);
        }
        return ir0;
    }
    @Override public IR visitEqualOrNot(MxstarParser.EqualOrNotContext ctx) {
        IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));
        Variable temp = nextVariable(symbolMap.operate(ir0.last.dest.type,ctx.op.getText(),ir1.last.dest.type) );
        temp.isTemp=true;
        if(ir0.last.dest.type.name.contains("string")){
            Quad quad = new Quad(ctx.op.getText().equals("==") ? OpCode.strequal : OpCode.strinequal, ir0.last.dest, ir1.last.dest, temp);
            ir0.concat(ir1);
            ir0.push(quad);
        }else {
            Quad quad = new Quad(ctx.op.getText().equals("==") ? OpCode.equal : OpCode.inequal, ir0.last.dest, ir1.last.dest, temp);
            ir0.concat(ir1);
            ir0.push(quad);
        }
        return ir0;
    }

    @Override public IR visitShift(MxstarParser.ShiftContext ctx) {
        IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));
        Variable temp = buildVariableLeft(ir0.last.dest,ctx.op.getText(),ir1.last.dest);
        temp.isTemp=true;
        Quad quad = new Quad(ctx.op.getText().equals("<<") ? OpCode.shiftLeft : OpCode.shiftRight,ir0.last.dest,ir1.last.dest,temp);
        ir0.concat(ir1);
        ir0.push(quad);
        return ir0;
    }
    @Override public IR visitAnd(MxstarParser.AndContext ctx) {
        IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));
        Variable temp = buildVariable(ir0.last.dest,"&",ir1.last.dest);
        temp.isTemp=true;
        Quad quad = new Quad(OpCode.and,ir0.last.dest,ir1.last.dest,temp);
        ir0.concat(ir1);
        ir0.push(quad);
        return ir0;
    }
    @Override public IR visitOr(MxstarParser.OrContext ctx) {             IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));
        Variable temp = buildVariable(ir0.last.dest,"|",ir1.last.dest);
        Quad quad = new Quad(OpCode.or,ir0.last.dest,ir1.last.dest,temp);
        ir0.concat(ir1);
        ir0.push(quad);
        return ir0;
    }
    @Override public IR visitXor(MxstarParser.XorContext ctx) {            IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));
        Variable temp = buildVariable(ir0.last.dest,"^",ir1.last.dest);
        temp.isTemp=true;
        Quad quad = new Quad(OpCode.xor,ir0.last.dest,ir1.last.dest,temp);
        ir0.concat(ir1);
        ir0.push(quad);
        return ir0;
    }





    private IR multiArray(int x, Variable temp, ArrayList<IR> parameterList){
        IR ir = new IR();
        if(x+1==parameterList.size())return ir;
        String label=nextLabel();
        Variable i = nextVariable(VariableType.INT);
        Variable ad = nextVariable(VariableType.INT);
        Variable head = nextVariable(VariableType.INT);
        Variable size = nextVariable(VariableType.INT);
        ir.push(new Quad(OpCode.move,nextConst(0,VariableType.CONST_INT),Variable.empty,i));
        ir.push(new Quad(OpCode.add,nextConst(4,VariableType.CONST_INT),temp,ad));
        ir.push(new Quad(OpCode.label,label));
        ir.push(new Quad(OpCode.multiply,parameterList.get(x+1).last.dest,nextConst(4,VariableType.CONST_INT),size));
        ir.push(new Quad(OpCode.add,size,nextConst(4,VariableType.CONST_INT),size));
        ir.push(new Quad(OpCode.malloc,size,Variable.empty,head));
        ir.push(new Quad(OpCode.store,parameterList.get(x+1).last.dest,Variable.empty,head));
        ir.push(new Quad(OpCode.store,head,Variable.empty,ad));

        IR tmpIR=multiArray(x+1,head,parameterList);
        ir.concat(tmpIR);

        ir.push(new Quad(OpCode.add,i,nextConst(1,VariableType.CONST_INT),i));
        ir.push(new Quad(OpCode.add,ad,nextConst(4,VariableType.CONST_INT),ad));
        ir.push(new Quad(OpCode.jne,i,parameterList.get(x).last.dest,label));

        return ir;
    }
    @Override public IR visitIndex(MxstarParser.IndexContext ctx) { return visit(ctx.expression()); }
    @Override public IR visitNewArray(MxstarParser.NewArrayContext ctx) {
        IR ir = new IR();
        int level = ctx.index().size() + ctx.bracket().size();
        Variable adr = nextVariable(new VariableType(ctx.type.getText(),level,false));
        ArrayList<IR>parameterList=new ArrayList<IR>();
        for(int i=0;i<ctx.index().size();i++){
            parameterList.add(visitIndex(ctx.index(i)));
            ir.concat(parameterList.get(i));
        }

        Variable size = nextVariable(VariableType.INT);

        //ir.push(new Quad(OpCode.multiply,parameterList.get(0).last.dest,nextConst()(4,VariableType.CONST_INT),size));
        //ir.push(new Quad(OpCode.add,size,nextConst()(4,VariableType.CONST_INT),size));
        //ir.push(new Quad(OpCode.malloc,size,Variable.empty,adr));
        //ir.push(new Quad(OpCode.store,parameterList.get(0).last.dest,Variable.empty,adr));
        if(parameterList.size()>1) {
            ir.push(new Quad(OpCode.mallocArray, nextConst(parameterList.size(), VariableType.CONST_INT), Variable.empty, adr));
            Variable pos = nextVariable(VariableType.INT);
            for (int i = 0; i < parameterList.size(); i++) {
                ir.push(new Quad(OpCode.address, adr, nextConst(i, VariableType.CONST_INT), pos));
                if(parameterList.size()==2&&i==0&&parameterList.get(i).last.dest.constValue>500000){
                 //   parameterList.get(i).last.dest.constValue=160000;
                }
                ir.push(new Quad(OpCode.store, parameterList.get(i).last.dest, Variable.empty, pos));
            }

            ir.push(new Quad(OpCode.multiArray, adr, Variable.empty, adr));
        }else{
            ir.push(new Quad(OpCode.mallocArray, parameterList.get(0).last.dest, Variable.empty, adr));
        }

        String name=ctx.type.getText();

        adr.type=new VariableType(name,level,false);
        ir.push(new Quad(OpCode.move,adr,Variable.empty,adr));


        return ir;
    }


    @Override public IR visitPrefixOperator(MxstarParser.PrefixOperatorContext ctx) {
        IR ir = visit(ctx.expression());
        Quad quad;
        Variable last = ir.last.dest;
        Variable temp = nextVariable(symbolMap.operate(ctx.op.getText(),last.type));
        temp.isTemp=true;
        switch (ctx.op.getText()){
            case "-":{
                quad = new Quad(OpCode.negate,last,Variable.empty,temp);
                ir.push(quad);
                break;
            }
            case "!":{
                quad = new Quad(OpCode.not,last,Variable.empty,temp);
                ir.push(quad);
                break;
            }
            case "~":{
                quad = new Quad(OpCode.inverse,last,Variable.empty,temp);
                ir.push(quad);
                break;
            }
        }
        return ir;
    }


    @Override public IR visitPrefixLvalueOperator(MxstarParser.PrefixLvalueOperatorContext ctx) {
        IR ir=new IR();
        OpCode opCode=ctx.op.getText().equals("++") ? OpCode.add :OpCode.subtract;
        if(ctx.leftValue().variable().size()==1) {
            String variableName = ctx.leftValue().variable(0).variableName().getText();
            ArrayList<IR> parameterList = new ArrayList<IR>();
            for (int i = 0; i < ctx.leftValue().variable(0).index().size(); i++) {
                parameterList.add(visit(ctx.leftValue().variable(0).index().get(i)));
            }
            IR adr = getAddress(variableName,parameterList);
            ir.concat(adr);
            if(parameterList.size()==0){
                ir.push(new Quad(opCode,adr.last.dest,nextConst(1,VariableType.CONST_INT),adr.last.dest));
            }else{
                Variable tmp=nextVariable(VariableType.INT);
                tmp.isTemp=true;
                ir.push(new Quad(OpCode.load,adr.last.dest,Variable.empty,tmp));
                ir.push(new Quad(opCode,tmp,nextConst(1,VariableType.CONST_INT),tmp));
                ir.push(new Quad(OpCode.store,tmp,Variable.empty,adr.last.dest));
                ir.push(new Quad(OpCode.move,tmp,Variable.empty,tmp));
            }
        }else{
            IR left=visit(ctx.leftValue());
            ir.concat(left);
            Variable tmp=nextVariable(VariableType.INT);
            tmp.isTemp=true;
            ir.push(new Quad(OpCode.load,left.last.dest,Variable.empty,tmp));
            ir.push(new Quad(opCode,tmp,nextConst(1,VariableType.CONST_INT),tmp));
            ir.push(new Quad(OpCode.store,tmp,Variable.empty,left.last.dest));
            ir.push(new Quad(OpCode.move,tmp,Variable.empty,tmp));
        }
        return ir;
        /*IR ir = visit(ctx.expression());
        Quad quad;
        Variable last = ir.last.dest;
        Variable temp = nextVariable(symbolMap.operate(ctx.op.getText(),last.type));
        switch (ctx.op.getText()){
            case "++":{
                quad = new Quad(OpCode.add,last,nextConst(1,VariableType.CONST_INT),last);
                ir.push(quad);
                quad = new Quad(OpCode.move,last,Variable.empty,temp);
                ir.push(quad);
                break;
            }
            case "--":{
                quad = new Quad(OpCode.subtract,last,nextConst(1,VariableType.CONST_INT),last);
                ir.push(quad);
                quad = new Quad(OpCode.move,last,Variable.empty,temp);
                ir.push(quad);
                break;
            }
        }
        return ir;*/
    }

    @Override public IR visitSuffixOperator(MxstarParser.SuffixOperatorContext ctx) {
        IR ir=new IR();
        OpCode opCode=ctx.op.getText().equals("++") ? OpCode.add :OpCode.subtract;
        Variable value=nextVariable(VariableType.INT);
        if(ctx.leftValue().variable().size()==1) {
            String variableName = ctx.leftValue().variable(0).variableName().getText();
            ArrayList<IR> parameterList = new ArrayList<IR>();
            for (int i = 0; i < ctx.leftValue().variable(0).index().size(); i++) {
                parameterList.add(visit(ctx.leftValue().variable(0).index().get(i)));
            }
            IR adr = getAddress(variableName,parameterList);
            ir.concat(adr);
            if(!adr.last.dest.type.name.contains("int"))
                ir.push(Quad.quadError("!int++"));
            if(parameterList.size()==0){
                ir.push(new Quad(OpCode.move,adr.last.dest,Variable.empty,value));
                ir.push(new Quad(opCode,adr.last.dest,nextConst(1,VariableType.CONST_INT),adr.last.dest));
                ir.push(new Quad(OpCode.move,value,Variable.empty,value));
            }else{
                Variable tmp=nextVariable(VariableType.INT);
                ir.push(new Quad(OpCode.load,adr.last.dest,Variable.empty,tmp));
                ir.push(new Quad(OpCode.move,tmp,Variable.empty,value));
                ir.push(new Quad(opCode,tmp,nextConst(1,VariableType.CONST_INT),tmp));
                ir.push(new Quad(OpCode.store,tmp,Variable.empty,adr.last.dest));
                ir.push(new Quad(OpCode.move,value,Variable.empty,value));
            }
        }else{
            IR left=visit(ctx.leftValue());
            ir.concat(left);
            Variable tmp=nextVariable(VariableType.INT);
            ir.push(new Quad(OpCode.load,left.last.dest,Variable.empty,tmp));
            ir.push(new Quad(OpCode.move,tmp,Variable.empty,value));
            ir.push(new Quad(opCode,tmp,nextConst(1,VariableType.CONST_INT),tmp));
            ir.push(new Quad(OpCode.store,tmp,Variable.empty,left.last.dest));
            ir.push(new Quad(OpCode.move,value,Variable.empty,value));
        }
        return ir;

    }

    @Override public IR visitMulDivMod(MxstarParser.MulDivModContext ctx) {
        IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));

        if(ir0.last.dest.type.equals(VariableType.CONST_INT)&&ir1.last.dest.type.equals(VariableType.CONST_INT)){
            IR ir=new IR();
            int a=ir0.last.dest.constValue,b=ir1.last.dest.constValue;
            int c=0;

            if(ctx.op.getText().equals("*"))
                c=a*b;
            if(ctx.op.getText().equals("/"))
                c=a/b;
            if(ctx.op.getText().equals("%"))
                c=a%b;
            Variable tmp=nextConst(c,VariableType.CONST_INT);

            ir.push(new Quad(OpCode.move,tmp,tmp,tmp));
            return ir;
        }

        Variable temp = buildVariableLeft(ir0.last.dest,ctx.op.getText(),ir1.last.dest);
        temp.isTemp=true;
        OpCode opCode=OpCode.multiply;
        if(ctx.op.getText().equals("*"))
            opCode=OpCode.multiply;
        if(ctx.op.getText().equals("/"))
            opCode=OpCode.divide;
        if(ctx.op.getText().equals("%"))
            opCode=OpCode.mod;
        Quad quad = new Quad(opCode,ir0.last.dest,ir1.last.dest,temp);
        ir0.concat(ir1);
        ir0.push(quad);
        return ir0;
    }
    @Override public IR visitAddSubtract(MxstarParser.AddSubtractContext ctx) {
        IR ir0=visit(ctx.expression(0));
        IR ir1=visit(ctx.expression(1));
        //Variable temp = nextVariable(symbolMap.operate(ir0.last.dest.type,ctx.op.getText(),ir1.last.dest.type) );
        //temp.isTemp=true;
        Variable temp = buildVariable(ir0.last.dest,ctx.op.getText(),ir1.last.dest) ;
        OpCode opCode=OpCode.add;
        if(ctx.op.getText().equals("+"))
            opCode=OpCode.add;
        if(ctx.op.getText().equals("-"))
            opCode=OpCode.subtract;

        Quad quad;
        if(temp.type.name.equals("string")){
            quad = new Quad(OpCode.concat,ir0.last.dest,ir1.last.dest,temp);
            ir0.concat(ir1);
            ir0.push(quad);
        }else{
            quad = new Quad(opCode,ir0.last.dest,ir1.last.dest,temp);
            ir0.concat(ir1);
            ir0.push(quad);
        }

        return ir0;
    }



    @Override public IR visitFunctionCall(MxstarParser.FunctionCallContext ctx) {
        IR ir=new IR();
        String functionName=ctx.functionName().getText();
        Function function=null;
        if(!currentClass.equals("")){
            function=symbolMap.functionMap.get(currentClass+"_"+functionName);
            if(function==null){
                function=symbolMap.functionMap.get(functionName);
            }
        }else{
            function=symbolMap.functionMap.get(functionName);
        }

        ArrayList<String> local = null;


        if(!recursionVisitor.isSafe(symbolMap.currentFunction,functionName)
                &&function!=null && symbolMap.localVariable.get(symbolMap.currentFunction)!=null ){
            local = (ArrayList<String>) symbolMap.localVariable.get(symbolMap.currentFunction).clone();
            ir.push(new Quad(OpCode.saveContext));
            for(String variable : local){
                //ir.push(new Quad(OpCode.push,new Variable(variable,VariableType.INT),Variable.empty,Variable.empty));
            }
            ir.push(new Quad(OpCode.endContext));
        }

        ArrayList<VariableType>parameter=new ArrayList<VariableType>();
        if(ctx.expressionList()!=null) {
            ir.concat(visit(ctx.expressionList()));
            parameter=currentParameter.peek();
            currentParameter.pop();
        }

        Variable returntemp=nextConst(0,VariableType.CONST_INT);
        if(function!=null) {
            returntemp=nextVariable(function.returnType);
            ir.push(new Quad(OpCode.call, function.name,returntemp));
            //ir.push(new Quad(OpCode.pop, Variable.empty,Variable.empty,));

            if(parameter.size()!=function.parameterList.size()){
                System.err.println("parameter not match");
                ir.push(Quad.quadError(""));
            }
            for(int i=0;i<parameter.size();i++)
                if(!parameter.get(i).match(function.parameterList.get(i))){
                    System.err.println("parameter not match");
                    ir.push(Quad.quadError(""));
                }
        }else{

            Variable temp = nextVariable(VariableType.STRING);
            Variable tmp = nextVariable(VariableType.INT);
            switch (functionName){
                case "getInt":
                    ir.push(new Quad(OpCode.getInt,Variable.empty,Variable.empty,nextVariable(VariableType.INT)));
                    break;
                case "getString":
                    ir.push(new Quad(OpCode.getString,Variable.empty,Variable.empty,nextVariable(VariableType.STRING)));
                    break;
                case "print":
                    ir.push(new Quad(OpCode.move,argList.get(0),Variable.empty,temp));
                    ir.push(new Quad(OpCode.print,temp,Variable.empty,Variable.empty));
                    break;
                case "println":
                    ir.push(new Quad(OpCode.move,argList.get(0),Variable.empty,temp));
                    ir.push(new Quad(OpCode.println,temp,Variable.empty,Variable.empty));
                    break;
                case "toString":
                    ir.push(new Quad(OpCode.move,argList.get(0),Variable.empty,tmp));
                    ir.push(new Quad(OpCode.toString,tmp,Variable.empty,temp));
                    break;
                default:
                    ir.push(Quad.quadError("FunctionCall Error"));
            }
        }

        if(!recursionVisitor.isSafe(symbolMap.currentFunction,functionName)
                &&function!=null && local !=null){
            ir.push(new Quad(OpCode.resumeContext));
            for(int i=local.size()-1;i>=0;i--){
                String vaiable = local.get(i);
               // ir.push(new Quad(OpCode.pop,Variable.empty,Variable.empty,new Variable(vaiable,VariableType.INT)));
            }
            ir.push(new Quad(OpCode.endContext));
            ir.push(new Quad(OpCode.move,returntemp,Variable.empty,returntemp));
        }

        return ir;
    }


    @Override public IR visitGetValue(MxstarParser.GetValueContext ctx) {
        IR ir = new IR();
        VariableType variableType = null;
        String variableName=ctx.variableName().getText();
        if(ctx.variableName().getText().equals("this")){
            variableType=currentThis.type;
        }else{
            variableType=symbolMap.variableMap.get(ctx.variableName().getText());
        }


        List<MxstarParser.ExpressionContext> tmp=ctx.expression();

        if(variableType==null){
            variableType=classMember.get(currentClass).get(ctx.variableName().getText()).type;
        }
        if(variableType==null || variableType.level<(ctx.expression()==null ? 0 :ctx.expression().size())){
            ir.push(Quad.quadError("GetValue Error"));
            return ir;
        }
        ArrayList<IR> parameterList =  new ArrayList<IR>();
        Variable variable = null;
        if(ctx.variableName().getText().equals("this")){
            variable = currentThis;
        }else{
            if(symbolMap.renameMap.get(ctx.variableName().getText())==null){
                variable = new Variable(ctx.variableName().getText(),variableType);
            }else{
                variable = new Variable(symbolMap.renameMap.get(ctx.variableName().getText()),variableType);
            }
        }
        if(ctx.expression().size()==0){
            ir.push(new Quad(OpCode.move,variable,Variable.empty,variable));
        }else{
            for(int i=0;i<ctx.expression().size();i++){
                parameterList.add(visit(ctx.expression(i)));
            }
            for(IR tmpIR : parameterList){
                Variable dest=tmpIR.last.dest;
                if(!dest.type.equals(VariableType.INT) && !dest.type.equals(VariableType.CONST_INT)){
                    ir.push(Quad.quadError("ArrayIndex is not an integer."));
                    break;
                }
                ir.concat(tmpIR);
            }
            Variable adr = nextVariable(VariableType.INT);
            Variable start = nextVariable(variableType.clone());
            ir.push(new Quad(OpCode.move,variable,Variable.empty,start));
            int used=0;
            for(IR tmpIR : parameterList){
                Variable dest=tmpIR.last.dest;
                Quad quad5=null;
                if((++used) < parameterList.size()) {
                    quad5 = new Quad(OpCode.load, adr, Variable.empty, start);
                }
                ir.push(new Quad(OpCode.address,start,dest,adr));
                ir.push(quad5);
                start.type.level--;
            }
            ir.push(new Quad(OpCode.load,adr,Variable.empty,nextVariable(start.type)));

        }

        return ir;
    }


    @Override public IR visitConstString(MxstarParser.ConstStringContext ctx) {
        IR ir = new IR();
        Variable temp = nextVariable(VariableType.CONST_STRING);
        constStringPool.put(temp,ctx.getText());//TODO fix \n \\ \"
        ir.push(new Quad(OpCode.move,temp,Variable.empty,temp));
        return ir;
    }
    @Override public IR visitConstNumber(MxstarParser.ConstNumberContext ctx) {
        IR ir = new IR();
        Variable temp = nextVariable(VariableType.CONST_INT);
        temp.constValue=Integer.parseInt(ctx.getText());
        ir.push(new Quad(OpCode.move,temp,Variable.empty,temp));
        return ir;
    }
    @Override public IR visitTrue(MxstarParser.TrueContext ctx) {
        IR ir = new IR();
        Variable temp = nextVariable(VariableType.CONST_BOOL);
        temp.constValue=1;
        ir.push(new Quad(OpCode.move,temp,Variable.empty,temp));
        return ir;
    }
    @Override public IR visitFalse(MxstarParser.FalseContext ctx) {
        IR ir = new IR();
        Variable temp = nextVariable(VariableType.CONST_BOOL);
        temp.constValue=0;
        ir.push(new Quad(OpCode.move,temp,Variable.empty,temp));
        return ir;
    }
    @Override public IR visitNull(MxstarParser.NullContext ctx) {
        IR ir = new IR();
        //Variable temp = nextVariable(VariableType.NULL);
        Variable temp = nextConst(0,VariableType.NULL);
        ir.push(new Quad(OpCode.move,temp,Variable.empty,temp));
        return ir;
    }

    @Override public IR visitVariableDefinitionWithoutAssignment(MxstarParser.VariableDefinitionWithoutAssignmentContext ctx) {

        IR ir=new IR();
        if(VariableType.toVariableType(ctx.variableType()).equals(VariableType.VOID)){
            System.err.println("Type can not be void");
            ir.push(Quad.quadError("Type can not be void"));
        }else{
            if(symbolMap.renameMap.get(ctx.variableType().getText())!=null){
                System.err.println("TAT");
                ir.push(Quad.quadError("TAT"));
            }
        }
        symbolMap.putSymbol(ctx.variableName().getText(),VariableType.toVariableType(ctx.variableType()));
        if(!symbolMap.typeMap.contains(VariableType.toVariableType(ctx.variableType()).name)){
            System.err.println("Type not found 5");
            ir.push(Quad.quadError("Type not found 5"));
        }
        return ir;
    }



    @Override public IR visitVariableDefinitionWithAssignment(MxstarParser.VariableDefinitionWithAssignmentContext ctx) {
        String variableName=ctx.variableName().getText();
        VariableType variableType=VariableType.toVariableType(ctx.variableType());


        IR ir = new IR();
        IR exp = visit(ctx.expression());
        ir.concat(exp);

        if(!symbolMap.typeMap.contains(variableType.name)){
            System.err.println("Type not found 6");
            ir.push(Quad.quadError("Type not found 6"));
        }else{
            if(symbolMap.getVariable(variableType.name)!=null){
                System.err.println("TAT");
                ir.push(Quad.quadError("TAT"));
            }
        }
        symbolMap.putSymbol(variableName,variableType);
        Variable variable = new Variable(symbolMap.renameMap.get(variableName),variableType);
        if(!variable.type.match(exp.last.dest.type))
            ir.push(Quad.quadError("Types did not match 1"));
        ir.push(new Quad(OpCode.move,exp.last.dest,Variable.empty,variable));
        return ir;
    }

    @Override public IR visitParentheses(MxstarParser.ParenthesesContext ctx) { return visit(ctx.expression()); }
    @Override public IR visitExpressionList(MxstarParser.ExpressionListContext ctx) {
        IR ir=new IR();
        ArrayList<Variable>arrayList=new ArrayList<Variable>();
        ArrayList<VariableType>parameterList=new ArrayList<VariableType>();
        if(ctx.expression()!=null)
        for(int i=0;i<ctx.expression().size();i++){
            IR tmpIR=visit(ctx.expression(i));
            ir.concat(tmpIR);
            arrayList.add(tmpIR.last.dest);
            parameterList.add(tmpIR.last.dest.type);
        }
        currentParameter.push(parameterList);
        for(int i=arrayList.size()-1;i>=0;i--){
            ir.push(new Quad(OpCode.move,arrayList.get(i),Variable.empty,argList.get(i)));
            //ir.push(new Quad(OpCode.push,arrayList.get(i),Variable.empty,Variable.empty));
        }
        return ir;
    }

}

public class Main {



    public static void main(String [] args) throws Exception {
       /* Scanner cin = new Scanner(System.in);

        FileInputStream fileInputStream = new FileInputStream(new File("./testcase/test7.mx"));
        Scanner fin = new Scanner(fileInputStream);

        StringBuilder ctx=new StringBuilder();+
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
        IR ir = visitor.visit(parseTree);
        visitor.symbolMap.print();
        ir.modify_same();
        ir.print();

        for(Map.Entry cst : visitor.constStringPool.entrySet()){
            System.out.println(cst.getKey()+" : "+cst.getValue());
        }

        IRSimulator irSimulator = new IRSimulator();
        irSimulator.setSimulator(ir,visitor.constStringPool);
        irSimulator.run();
        //translate(ir);

        //System.out.println("#result#="+rtn.toString());*/
    }
}

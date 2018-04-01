package cn.kzoacn;

import com.sun.corba.se.impl.orbutil.closure.Constant;
import sun.invoke.util.VerifyAccess;
import sun.util.resources.cldr.zh.CalendarData_zh_Hans_HK;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Stack;

public class IRTranslator {

    IR ir;
    HashMap<Variable,String> constStringPool;
    SymbolMap symbolMap;

    void setSimulator(IR ir, HashMap<Variable,String>constStringPool,SymbolMap symbolMap){
        this.ir=ir;
        this.constStringPool=constStringPool;
        this.symbolMap=symbolMap;
    }
    IRTranslator(){}

    /*enum OpCode{
        not,inverse,negate,
        add,subtract,multiply,divide,mod,
        and,or,xor,
        shiftLeft,shiftRight,
        move,
        push,pop,
        call,ret,
        label,
        less,leq,equal,inequal,geq,greater,
        jmp,jz,jnz,jne,
        malloc,
        load,store,
        print,println,getString,getInt,toString
    }
    */


    int byteArrayToInt(byte[] b) {
        return   b[3] & 0xFF |
                (b[2] & 0xFF) << 8 |
                (b[1] & 0xFF) << 16 |
                (b[0] & 0xFF) << 24;
    }
    byte[] intToByteArray(int a) {
        return new byte[] {
                (byte) ((a >> 24) & 0xFF),
                (byte) ((a >> 16) & 0xFF),
                (byte) ((a >> 8) & 0xFF),
                (byte) (a & 0xFF)
        };
    }

    /*
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
        jmp,jz,jnz,jne,
        malloc,mallocArray,concat,
        load,store,address,
        print,println,getString,getInt,toString,
        saveContext,resumeContext,
    }*/

    void compile(String fileName)throws Exception{
        run(fileName);


    }


    HashMap<Variable,Integer> variableIndex = new HashMap<Variable,Integer>();


    void putVariable(Variable variable){
        if(variable==null || variable.equals(Variable.empty))
            return ;

        if(!variable.type.name.contains("const") && !variableIndex.containsKey(variable)){
            variableIndex.put(variable,variableIndex.size());
        }
    }
    int getIndex(Variable variable){
        if(variable==null || variable.equals(Variable.empty))
            return -1;
        return variableIndex.get(variable);
    }
    String currentFunctoin="";
    StringBuffer varName(Variable variable){
        if(variable.type.name.equals("const_string"))
            return new StringBuffer(variable.name);
        if(variable.type.name.equals("const_int"))
            return new StringBuffer(Integer.toString(variable.constValue));
        if(symbolMap.globalVariableMap.containsKey(variable.name))
            return new StringBuffer("[gbl+8*"+Integer.toString(variableIndex.get(variable))+"]");
        if(variableIndex.containsKey(variable))
            return new StringBuffer("[rsp+8*"+Integer.toString(variableIndex.get(variable))+"]");
        return new StringBuffer(Integer.toString(variable.constValue));
    }
    StringBuffer mov(Variable var,Variable dest){
        if(variableIndex.containsKey(var)&&variableIndex.containsKey(dest)){
            return new StringBuffer("mov "+"r8, "+varName(var)+"\n\t"
                                    +"mov qword "+varName(dest)+" ,r8\n\t");
        }

        return new StringBuffer("mov qword "+varName(dest)+" ,"+varName(var)+"\n\t");
    }
    StringBuffer println(Variable var) {
        StringBuffer cmd=new StringBuffer();
        cmd.append("mov rdi, formatln\n\t");
        cmd.append("mov rsi,"+ varName(var) +" \n\t");
        cmd.append("add rsi, 1 \n\t");
        cmd.append("xor rax, rax\n\t");
        cmd.append("call printf\n\t");
        return  cmd;
    }
    StringBuffer print(Variable var) {
        StringBuffer cmd=new StringBuffer();
        cmd.append("mov rdi, format\n\t");
        cmd.append("mov rsi,"+ varName(var) +" \n\t");
        cmd.append("add rsi, 1 \n\t");
        cmd.append("xor rax, rax\n\t");
        cmd.append("call printf\n\t");
        return  cmd;
    }

    void run(String fileName)throws Exception{
        StringBuffer result=new StringBuffer();
        StringBuffer head=new StringBuffer("");
        StringBuffer text=new StringBuffer("");
        StringBuffer bss=new StringBuffer("");
        StringBuffer data=new StringBuffer("");

        head.append("\t global    main\n");
        head.append("\t extern    puts\n");
        head.append("\t extern    printf\n");
        head.append("\t extern    scanf\n");
        head.append("\t extern    malloc\n");
        text.append("\t section   .text\n");
        bss.append("\t section   .bss\n");
        data.append("\t section   .data\n");

        for(Quad cur=ir.head;cur!=null;cur=cur.next) {
            putVariable(cur.var1);
            putVariable(cur.var2);
            putVariable(cur.dest);
        }

        bss.append("gbl:         resb   "+Integer.toString(variableIndex.size()*8)+"\n");

        data.append(new StringBuffer("\nformatln:\n\t"));
        data.append(new StringBuffer("db  \"%s\", 10, 0\n\t"));
        data.append(new StringBuffer("\nformat:\n\t"));
        data.append(new StringBuffer("db  \"%s\",  0\n\t"));

        for(Map.Entry<Variable,String> entry : constStringPool.entrySet()){
            String string=entry.getValue();
            data.append("\n"+entry.getKey()+":\n\t db "+ Integer.toString(string.length())+","+string +" ,0\n");
            //variableMap.put(entry.getKey(),allocateString(string.substring(1,string.length()-1)));
        }

        text.append(ConstantPool.toStringFunction).append("\n");
        text.append(ConstantPool.mallocArrayFunction).append("\n");
        text.append(ConstantPool.concatFunction).append("\n");
        text.append(ConstantPool.addressFunction).append("\n");
        text.append(ConstantPool.multiArrayFunction).append("\n");
       // text.append("start:\n\t");
       // text.append("jmp main\n\t");


        int skipCounter=0;
        for(Quad cur=ir.head;cur!=null;cur=cur.next){
            Variable var1=cur.var1;
            Variable var2=cur.var2;
            Variable dest=cur.dest;
            String name=cur.name;

            if(cur.opCode.equals(OpCode.saveContext))
                skipCounter++;
            if(cur.opCode.equals(OpCode.resumeContext))
                skipCounter++;
            if(cur.opCode.equals(OpCode.endContext))
                skipCounter--;
            if(skipCounter>0){
                cur=cur.next;
            }

            switch (cur.opCode){
                case not:
                    text.append(new StringBuffer("mov r8, "+ varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("cmp r8, 0\n\t"));
                    text.append(new StringBuffer("sete "+varName(dest)+"\n\t"));
                    break;
                case inverse:
                    text.append(new StringBuffer("mov r8, "+ varName(var1)+"\n\t"));
                    text.append(new StringBuffer("not r8\n\t"));
                    text.append(new StringBuffer("mov "+varName(dest)+", r8\n\t"));
                    break;
                case negate:
                    text.append(new StringBuffer("mov r8, "+ varName(var1)+"\n\t"));
                    text.append(new StringBuffer("neg r8\n\t"));
                    text.append(new StringBuffer("mov "+varName(dest)+", r8\n\t"));
                    break;
                case add:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("add r8, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case subtract:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("sub r8, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case multiply:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("imul r8, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case divide:
                    text.append(new StringBuffer("xor rdx, rdx\n\t"));
                    text.append(new StringBuffer("mov rax, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rbx, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cdq\n\t"));
                    text.append(new StringBuffer("idiv rbx\n\t"));
                    text.append(new StringBuffer("mov "+varName(dest)+", rax\n\t"));
                    /*
                    fileOut.print("xor edx,edx\n");
                    fileOut.printf("mov eax, %s\n",getNum(cur.var1));
                    fileOut.printf("mov ebx, %s\n",getNum(cur.var2));
                    fileOut.println("cdq");
                    fileOut.print("idiv ebx\n");
                    fileOut.printf("mov %s, eax\n",getNum(cur.dest));*/
                    break;
                case mod:
                    text.append(new StringBuffer("xor rdx, rdx\n\t"));
                    text.append(new StringBuffer("mov rax, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rbx, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cdq\n\t"));
                    text.append(new StringBuffer("idiv rbx\n\t"));
                    text.append(new StringBuffer("mov "+varName(dest)+", rdx\n\t"));
                    break;
                case and:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("and r8, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case or:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("or r8, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case xor:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("xor r8, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case shiftLeft:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("shl r8, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case shiftRight:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("ror r8d, dword "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case move:
                    text.append(mov(var1,dest));
                    break;
                case push:
                    text.append(new StringBuffer("push qword "+varName(var1)+"\n\t"));
                    break;
                case pop:
                    text.append(new StringBuffer("pop qword "+varName(dest)+"\n\t"));
                    break;
                case call:
                    text.append(new StringBuffer("call "+name+"\n\t"));
                    break;
                case ret:
                    text.append(new StringBuffer("leave\n\t"));
                    text.append(new StringBuffer("ret\n\t"));
                    break;
                case label:
                    text.append(new StringBuffer("\n"+name+":\n\t"));
                    break;
                case less:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setl "+varName(dest)+"\n\t"));
                    break;
                case leq:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setle "+varName(dest)+"\n\t"));
                    break;
                case equal:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("sete "+varName(dest)+"\n\t"));
                    break;
                case inequal:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setne "+varName(dest)+"\n\t"));
                    break;
                case geq:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setge "+varName(dest)+"\n\t"));
                    break;
                case greater:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setg "+varName(dest)+"\n\t"));
                    break;
                case jmp:
                    text.append(new StringBuffer("jmp "+name+"\n\t"));
                    break;
                case jz:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, 0\n\t"));
                    text.append(new StringBuffer("je "+name+"\n\t"));
                    break;
                case jnz:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, 0\n\t"));
                    text.append(new StringBuffer("jne "+name+"\n\t"));
                    break;
                case jne:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("jne "+varName(dest)+"\n\t"));
                    break;
                case malloc:
                    text.append(new StringBuffer(
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    malloc\n\t"+
                                    "mov     qword "+varName(dest)+", rax\n\t"));
                    break;
                case mallocArray:
                    text.append(new StringBuffer(
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    mallocArray\n\t"+
                                    "mov     qword "+varName(dest)+", rax\n\t"));
                    break;
                case concat:
                    text.append(new StringBuffer(
                            "mov     rsi, "+varName(var2)+"\n\t" +
                            "mov     rdi, "+varName(var1)+"\n\t" +
                            "call    concat\n\t") +
                            "mov "+varName(dest)+", rax\n\t");
                    break;
                case load:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r8, [r8]\n\t"));
                    text.append(new StringBuffer("mov "+varName(dest)+", r8\n\t"));
                    break;
                case store:
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(dest)+"\n\t"));
                    text.append(new StringBuffer("mov qword [r9], r8\n\t"));
                    break;
                case address:
                    text.append(new StringBuffer(
                                    "mov     rsi, "+varName(var2)+"\n\t" +
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    address\n\t") +
                                    "mov "+varName(dest)+", rax\n\t");
                    break;
                case print:
                    text.append(print(var1));
                    break;
                case println:
                    text.append(println(var1));
                    break;
                case getString:
                    break;
                case getInt:
                    break;
                case toString:
                    text.append(new StringBuffer(
                            "mov     rdi, "+varName(var1)+"\n\t" +
                            "call    toString\n\t"+
                            "mov     qword"+varName(dest)+", rax\n\t"));
                    break;
                case saveContext:
                    break;
                case resumeContext:
                    break;
                case exitFunction:
                    break;
                case enterFunction:
                    text.append(new StringBuffer("push   rbp\n\t"));
                    text.append(new StringBuffer("mov    rbp, rsp\n\t"));
                    text.append(new StringBuffer("sub    rsp, "+Integer.toString(variableIndex.size()*8)+"\n\t")); //TODO
                    break;
                case endContext:
                    break;
                case multiArray:
                    text.append(new StringBuffer(
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    multiArray\n\t"+
                                    "mov     qword "+varName(dest)+", rax\n\t"));
                    break;
            }
        }


        result=head.append("\n").append(text).append("\n").append(bss).append("\n").append(data).append("\n");
        PrintWriter output = new PrintWriter(new FileOutputStream(new File("./testcase/" + fileName+".nasm")));
        output.println(result.toString());
        output.close();
        return ;
    }

}

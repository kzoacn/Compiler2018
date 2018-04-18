package cn.kzoacn;


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
    HashMap<Variable,Integer> variableLastIndex = new HashMap<Variable,Integer>();


    int currentLine=0;
    void putVariable(Variable variable){
        if(variable==null || variable.equals(Variable.empty))
            return ;
        variableLastIndex.put(variable,currentLine);
        if(!variable.type.name.contains("const") && !variableIndex.containsKey(variable)){
            variableIndex.put(variable,variableIndex.size()+1);
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
        if(variable.type.name.equals("const_bool"))
            return new StringBuffer(Integer.toString(variable.constValue));
        if(variable.type.name.equals("null"))
            return new StringBuffer(Integer.toString(0));
        if(symbolMap.argVariableMap.containsKey(variable.name))
            return new StringBuffer("[arg+8*"+Integer.toString(variable.constValue)+"]");
        if(symbolMap.globalVariableMap.containsKey(variable.name))
            return new StringBuffer("[gbl+8*"+Integer.toString(variableIndex.get(variable))+"]");
        if(variableIndex.containsKey(variable))
            return new StringBuffer("[rsp+8*"+Integer.toString(variableIndex.get(variable))+"]");
        return new StringBuffer(Integer.toString(variable.constValue));
    }
    boolean isConst(Variable variable){
        if(variable.type.name.equals("const_string"))
            return true;
        if(variable.type.name.equals("const_int"))
            return true;
        if(variable.type.name.equals("const_bool"))
            return true;
        if(variable.type.name.equals("null"))
            return true;
        if(symbolMap.argVariableMap.containsKey(variable.name))
            return false;
        if(symbolMap.globalVariableMap.containsKey(variable.name))
            return false;
        if(variableIndex.containsKey(variable))
            return false;
        return true;
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
    String format(String s){
        String res="";
        res+="\"";
        for(int i=1;i+1<s.length();i++){
            if(s.charAt(i)=='\\'){
                res+="\"";
                res+=",";
                if(s.charAt(i+1)=='n')
                    res+=Integer.toString(10);
                else
                    res+=Integer.toString(s.charAt(i+1));
                res+=",";
                res+="\"";
                i++;
            }else{
                res+=String.valueOf(s.charAt(i));
            }
        }
        res+="\"";
        return res;
    }
    int format_length(String s){
        int ans=0;
        for(int i=1;i+1<s.length();i++){
            if(s.charAt(i)=='\\'){
                ans++;
                i++;
            }else{
                ans++;
            }
        }
        return ans;
    }

    public static StringBuffer text=new StringBuffer("");
    /*HashMap<Variable,Integer>registerLocation=new HashMap<Variable,Integer>();
    String getReg(Variable variable){
        int id=registerLocation.get(variable);

    }*/

    static boolean[] writeBack=new boolean[16];
    static boolean[] free=new boolean[16];
    static Variable[] occ=new Variable[16];
    static boolean[] ban=new boolean[16];
    static int[] lastUsedTime=new int[16];
    static int russ=10;
    void kick(int x){

        if(writeBack[x]) {
            if (!isConst(occ[x]))
                text.append(new StringBuffer("mov qword " + varName(occ[x]) + ",r" + Integer.toString(x) + "\n\t"));
        }
        writeBack[x]=false;
        free[x]=true;
        occ[x]=null;
    }
    void kick(Variable var){
        for(int i=8;i<16;i++){
            if(!free[i]&&occ[i].equals(var))
                kick(i);
        }
    }
    void kickAll(){
        for(int i=0;i<16;i++)if(!free[i])
            kick(i);
    }
    void clearAll(){
        for(int i=0;i<16;i++){
            free[i]=true;
        }
    }

    void unlock(){
        for(int i=8;i<16;i++){
            ban[i]=false;
        }
    }
    int reserveRegister(){
        int pos=-1;
        //LRU
        /*int mn=2000000000;
        for(int i=8;i<16;i++){
            if(ban[i])continue;
            if(lastUsedTime[i]<mn){
                mn=lastUsedTime[i];
                pos=i;
            }
        }

        kick(pos);*/

        int mx=-1;
        for(int i=8;i<16;i++){
            if(ban[i])continue;
            if(variableLastIndex.get(occ[i])<currentLine){
                pos=i;
                break;
            }
            if(variableLastIndex.get(occ[i])>mx){
                mx=variableLastIndex.get(occ[i]);
                pos=i;
            }
        }

        kick(pos);

        return pos;
    }
    void put(int i,Variable var,boolean read){
        if(read) {
            if (isConst(var)) {
                text.append(new StringBuffer("mov r" + Integer.toString(i) + "," + varName(var) + "\n\t"));
            } else {
                text.append(new StringBuffer("mov r" + Integer.toString(i) + ", qword " + varName(var) + "\n\t"));
            }
        }else{
            writeBack[i]=true;
        }
        free[i]=false;
        occ[i]=var;
        ban[i]=true;
        lastUsedTime[i]=currentLine;
    }

    int getRegister(Variable var,boolean read){
        for(int i=8;i<16;i++){
            if(!free[i]&&occ[i].equals(var)) {
                ban[i]=true;
                lastUsedTime[i]=currentLine;
                if(!read)
                    writeBack[i]=true;
                return i;
            }
        }
        for(int i=8;i<16;i++){
            if(free[i]) {
                put(i,var,read);
                return i;
            }
        }
        int pos=reserveRegister();
        put(pos,var,read);
        return pos;
    }
    String getReg(Variable var){
        getRegister(var,true);
        getRegister(var,false);
        return "r"+getRegister(var,true);
    }
    String writeReg(Variable var){
        return "r"+getRegister(var,false);
    }
    String readReg(Variable var){
        return "r"+getRegister(var,true);
    }
    void run(String fileName)throws Exception{
        for(int i=0;i<16;i++) {
            free[i] = true;
            ban[i] = false;
            lastUsedTime[i]=0;
            writeBack[i]=false;
        }
        StringBuffer result=new StringBuffer();
        StringBuffer head=new StringBuffer("");
        text=new StringBuffer("");
        StringBuffer bss=new StringBuffer("");
        StringBuffer data=new StringBuffer("");

        head.append("\t global    main\n");
        head.append("\t extern    puts\n");
        head.append("\t extern    printf\n");
        head.append("\t extern    scanf\n");
        head.append("\t extern    malloc\n");
        head.append("\t extern    strlen\n");
        head.append("\t extern    strcmp\n");
        head.append("\t extern    memset\n");
        text.append("\t section   .text\n");
        bss.append("\t section   .bss\n");
        data.append("\t section   .data\n");

        for(Quad cur=ir.head;cur!=null;cur=cur.next) {
            currentLine++;
            putVariable(cur.var1);
            putVariable(cur.var2);
            putVariable(cur.dest);
        }

        bss.append("gbl:         resb   "+Integer.toString(variableIndex.size()*8+2048)+"\n");
        bss.append("buff.1788:\n" +
                "        resb    256\n");
        bss.append("arg:\n" +
                "        resb    1024\n");

        data.append(new StringBuffer("\nformatln:\n\t"));
        data.append(new StringBuffer("db  \"%s\", 10, 0\n\t"));
        data.append(new StringBuffer("\nformat:\n\t"));
        data.append(new StringBuffer("db  \"%s\",  0\n\t"));
        data.append(new StringBuffer("\nGS_31:\n\t"));
        data.append(new StringBuffer("db 25H, 6CH, 64H, 00H\n\t"));
        data.append(new StringBuffer("\nGS_32:\n\t"));
        data.append(new StringBuffer("db 25H, 73H, 00H\n\t"));

        for(Map.Entry<Variable,String> entry : constStringPool.entrySet()){
            String string=entry.getValue();
            data.append("\n"+entry.getKey()+":\n\t db "+ Integer.toString(format_length(string))+","+format(string) +" ,0\n");
            //variableMap.put(entry.getKey(),allocateString(string.substring(1,string.length()-1)));
        }

        text.append(ConstantPool.toStringFunction).append("\n");
        text.append(ConstantPool.mallocArrayFunction).append("\n");
        text.append(ConstantPool.concatFunction).append("\n");
        text.append(ConstantPool.addressFunction).append("\n");
        text.append(ConstantPool.multiArrayFunction).append("\n");
        text.append(ConstantPool.multiAddressFunction).append("\n");
        text.append(ConstantPool.getIntFunction).append("\n");
        text.append(ConstantPool.getStringFunction).append("\n");
        text.append(ConstantPool.parseIntFunction).append("\n");
        text.append(ConstantPool.substringFunction).append("\n");
        text.append(ConstantPool.ordFunction).append("\n");
        text.append(ConstantPool.strcmpFunction).append("\n");
       // text.append("start:\n\t");
       // text.append("jmp main\n\t");


        int skipCounter=0;
        int line=0;
        for(Quad cur=ir.head;cur!=null;cur=cur.next){
            line+=1;
            currentLine++;
            Variable var1=cur.var1;
            Variable var2=cur.var2;
            Variable dest=cur.dest;
            String name=cur.name;
            //System.err.println(cur.opCode);
            if(cur.opCode.equals(OpCode.saveContext))
                skipCounter++;
            if(cur.opCode.equals(OpCode.resumeContext))
                skipCounter++;
            if(cur.opCode.equals(OpCode.endContext))
                skipCounter--;
            if(skipCounter>0){
                //cur=cur.next;
                continue;
            }



            unlock();//!!

            switch (cur.opCode){
                case not:
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("cmp "+readReg(var1)+", 0\n\t"));
                    text.append(new StringBuffer("sete "+writeReg(dest)+"B\n\t"));
                    //kickAll();
                    break;
                case inverse:
                    readReg(var1);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("not "+writeReg(dest)+"\n\t"));
                    //kickAll();
                    //text.append(new StringBuffer("mov r8, "+ varName(var1)+"\n\t"));
                    //text.append(new StringBuffer("not r8\n\t"));
                    //text.append(new StringBuffer("mov "+varName(dest)+", r8\n\t"));
                    break;
                case negate:
                    //text.append(new StringBuffer("mov r8, "+ varName(var1)+"\n\t"));
                    //text.append(new StringBuffer("neg r8\n\t"));
                    //text.append(new StringBuffer("mov "+varName(dest)+", r8\n\t"));
                    readReg(var1);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("neg "+writeReg(dest)+"\n\t"));
                    //kickAll();
                    break;
                case add:
                    readReg(var1);readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("add "+writeReg(dest)+","+readReg(var2)+"\n\t"));
                    //kickAll();

                    //text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    //text.append(new StringBuffer("add r8, "+varName(var2)+"\n\t"));
                    //text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case subtract:
                    readReg(var1);readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("sub "+writeReg(dest)+","+readReg(var2)+"\n\t"));
                    //kickAll();
                    //text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    //text.append(new StringBuffer("sub r8, "+varName(var2)+"\n\t"));
                    //text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case multiply:
                    readReg(var1);readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("imul "+writeReg(dest)+","+readReg(var2)+"\n\t"));
                    //kickAll();
                    break;
                case divide:
                    text.append(new StringBuffer("xor rdx, rdx\n\t"));
                    text.append(new StringBuffer("mov rax, "+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rbx, "+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("cdq\n\t"));
                    text.append(new StringBuffer("idiv rbx\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", rax\n\t"));
                    //kickAll();
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
                    text.append(new StringBuffer("mov rax, "+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rbx, "+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("cdq\n\t"));
                    text.append(new StringBuffer("idiv rbx\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", rdx\n\t"));
                    //kickAll();
                    break;
                case and:
                    readReg(var1);readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("and "+writeReg(dest)+","+readReg(var2)+"\n\t"));
                    //kickAll();
                    break;
                case or:
                    readReg(var1);readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("or "+writeReg(dest)+","+readReg(var2)+"\n\t"));
                    //kickAll();
                    break;
                case xor:
                    readReg(var1);readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("xor "+writeReg(dest)+","+readReg(var2)+"\n\t"));
                    //kickAll();
                    break;
                case shiftLeft:
                    readReg(var1);readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("shl "+writeReg(dest)+","+var2.constValue+"\n\t"));
                    //kickAll();
                    break;
                case shiftRight:
                    readReg(var1);readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("ror "+writeReg(dest)+","+readReg(var2)+"\n\t"));
                    //kickAll();
                    break;
                case move:
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    //kickAll();
                    break;
                case push:
                    //text.append(new StringBuffer("push qword "+varName(var1)+"\n\t"));
                    break;
                case pop:
                    //text.append(new StringBuffer("pop qword "+varName(dest)+"\n\t"));
                    break;
                case call:
                    kickAll();
                    text.append(new StringBuffer("call "+name+"\n\t"));
                    clearAll();
                    text.append(new StringBuffer("mov "+writeReg(dest)+" , rax\n\t"));

                    break;
                case ret:
                    text.append(new StringBuffer("mov rax," +readReg(var1)+"\n\t"));
                    kickAll();
                    text.append(new StringBuffer("leave\n\t"));
                    text.append(new StringBuffer("ret\n\t"));
                    break;
                case label:
                    kickAll();
                    text.append(new StringBuffer("\n"+name+":\n\t"));
                    break;
                case less:

                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setl "+writeReg(dest)+"B\n\t"));
                    kickAll();


                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setl "+varName(dest)+"\n\t"));*/

                    break;
                case leq:
                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setle "+writeReg(dest)+"B\n\t"));
                    kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setle "+varName(dest)+"\n\t"));*/
                    break;
                case equal:
                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("sete "+writeReg(dest)+"B\n\t"));
                    kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("sete "+varName(dest)+"\n\t"));
                    */break;
                case inequal:
                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setne "+writeReg(dest)+"B\n\t"));
                    kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setne "+varName(dest)+"\n\t"));
                    */break;
                case geq:
                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setge "+writeReg(dest)+"B\n\t"));
                    kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setge "+varName(dest)+"\n\t"));*/
                    break;
                case greater:
                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setg "+writeReg(dest)+"B\n\t"));
                    kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setg "+varName(dest)+"\n\t"));*/
                    break;
                case strless:
                    /*text.append(new StringBuffer("mov rdi, "+getReg(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+getReg(var2)+"\n\t"));
                    text.append(new StringBuffer("xor rax,rax\n\t"));
                    text.append(new StringBuffer("call    strls\n\t"));
                    text.append(new StringBuffer("mov  "+getReg(dest)+", rax\n\t"));
                    kickAll();*/
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("call    strls\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strleq:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("call    strle\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strequal:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("call    streq\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strinequal:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("call    strne\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strgeq:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("call    strge\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strgreater:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("call    strgt\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case jmp:
                    kickAll();
                    text.append(new StringBuffer("jmp "+name+"\n\t"));
                    break;
                case jz:
                    text.append(new StringBuffer("cmp "+readReg(var1)+", 0\n\t"));
                    kickAll();
                    text.append(new StringBuffer("je "+name+"\n\t"));
                    break;
                case jnz:
                    text.append(new StringBuffer("cmp "+readReg(var1)+", 0\n\t"));
                    kickAll();
                    text.append(new StringBuffer("jne "+name+"\n\t"));
                    break;
                case jne:
                    kickAll();
                    text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("jne "+varName(dest)+"\n\t"));
                    break;
                case malloc:
                    kickAll();
                    text.append(new StringBuffer(
                                    "mov     rdi, "+readReg(var1)+"\n\t" +
                                    "call    malloc\n\t"+
                                    "mov     qword "+writeReg(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case mallocArray:

                    kickAll();
                    text.append(new StringBuffer(
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    mallocArray\n\t"+
                                    "mov     qword "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case concat:
                    kickAll();
                    text.append(new StringBuffer(
                            "mov     rsi, "+varName(var2)+"\n\t" +
                            "mov     rdi, "+varName(var1)+"\n\t" +
                            "call    concat\n\t") +
                            "mov "+varName(dest)+", rax\n\t");
                    clearAll();
                    break;
                case load:
                    getReg(var1);
                    text.append(new StringBuffer("mov "+writeReg(dest)+", ["+readReg(var1)+"]\n\t"));
                    //kickAll();
                    //text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    //text.append(new StringBuffer("mov r8, [r8]\n\t"));
                    //text.append(new StringBuffer("mov "+varName(dest)+", r8\n\t"));
                    break;
                case store:
                    text.append(new StringBuffer("mov ["+readReg(dest)+"],"+readReg(var1)+"\n\t"));
                    //kickAll();
                    //text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    //text.append(new StringBuffer("mov r9, "+varName(dest)+"\n\t"));
                    //text.append(new StringBuffer("mov qword [r9], r8\n\t"));
                    break;
                case address:
                    //kickAll();
                    readReg(var1);
                    readReg(var2);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var2))+"\n\t");
                    text.append(new StringBuffer("add "+writeReg(dest)+",1\n\t"));
                    text.append(new StringBuffer("shl "+writeReg(dest)+",4\n\t"));
                    text.append(new StringBuffer("add "+writeReg(dest)+","+readReg(var1))+"\n\t");

                    /*text.append(new StringBuffer(
                                    "mov     rsi, "+readReg(var2)+"\n\t" +
                                    "mov     rdi, "+readReg(var1)+"\n\t" +
                                    "call    address\n\t") +
                                    "mov "+writeReg(dest)+", rax\n\t");*/
                    //clearAll();
                    break;
                case print:
                    kickAll();
                    text.append(print(var1));
                    clearAll();
                    break;
                case println:
                    kickAll();
                    text.append(println(var1));
                    clearAll();
                    break;
                case getString:
                    kickAll();
                    text.append(new StringBuffer("call    getString\n\t" +
                            "mov     "+ varName(dest) +", rax\n\t"));
                    clearAll();
                    break;
                case getInt:
                    kickAll();
                    text.append(new StringBuffer("call    getInt\n\t" +
                                                "mov     "+ varName(dest) +", rax\n\t"));
                    clearAll();
                    break;
                case toString:
                    kickAll();
                    text.append(new StringBuffer(
                            "mov     rdi, "+varName(var1)+"\n\t" +
                            "call    toString\n\t"+
                            "mov     qword"+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case saveContext:
                    break;
                case resumeContext:
                    break;
                case exitFunction:

                    kickAll();
                    break;
                case enterFunction:
                    text.append(new StringBuffer("push   rbp\n\t"));
                    text.append(new StringBuffer("mov    rbp, rsp\n\t"));
                    text.append(new StringBuffer("sub    rsp, "+Integer.toString(variableIndex.size()*8+64)+"\n\t")); //TODO
                    break;
                case endContext:
                    break;
                case multiArray:
                    kickAll();
                    text.append(new StringBuffer(
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    multiArray\n\t"+
                                    "mov     qword "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case multiAddress:
                    kickAll();
                    text.append(new StringBuffer(
                                    "mov     rsi, "+varName(var2)+"\n\t" +
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    multiAddress\n\t") +
                                    "mov "+varName(dest)+", rax\n\t");
                    clearAll();
                    break;
                case substring:
                    kickAll();
                    text.append(new StringBuffer(
                                    "mov     rsi, "+varName(var2)+"\n\t" +
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    substring\n\t") +
                                    "mov "+varName(dest)+", rax\n\t");
                    clearAll();
                    break;
                case parseInt:
                    kickAll();
                    text.append(new StringBuffer(
                                    "call    parseInt\n\t"+
                                    "mov     qword "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case ord:
                    kickAll();
                    text.append(new StringBuffer(
                                    "mov     rdi, "+varName(var1)+"\n\t" +
                                    "call    ord\n\t"+
                                    "mov     qword "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;

            }
        }


        result=head.append("\n").append(text).append("\n").append(bss).append("\n").append(data).append("\n");
        PrintWriter output = new PrintWriter(new FileOutputStream(new File(fileName)));
        output.println(result.toString());
        output.close();
        //System.err.println(result);
        return ;
    }

}

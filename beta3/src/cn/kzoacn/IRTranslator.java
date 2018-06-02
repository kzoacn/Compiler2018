package cn.kzoacn;



import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.*;

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
    HashMap<Variable,Integer> variableFirstIndex = new HashMap<Variable,Integer>();


    int currentLine=0;
    void putVariable(Variable variable){
        if(variable==null || variable.equals(Variable.empty))
            return ;
        variableLastIndex.put(variable,currentLine);
        if(!variableFirstIndex.containsKey(variable))
            variableFirstIndex.put(variable,currentLine);
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
        if(symbolMap.argVariableMap.containsKey(variable.name)) {
            if(variable.constValue==0)
                return new StringBuffer("rdi");
            if(variable.constValue==1)
                return new StringBuffer("rsi");
            return new StringBuffer("[arg+8*" + Integer.toString(variable.constValue) + "]");
        }
        if(variable.register>0&&variable.register<=8)
           return new StringBuffer(" r"+Integer.toString(16-variable.register));
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
            return new StringBuffer("mov "+"rcx, "+varName(var)+"\n\t"
                                    +"mov qword "+varName(dest)+" ,rcx\n\t");
        }

        return new StringBuffer("mov qword "+varName(dest)+" ,"+varName(var)+"\n\t");
    }
    StringBuffer println(Variable var) {
        StringBuffer cmd=new StringBuffer();
        cmd.append("mov rdi,"+ varName(var) +" \n\t");
        cmd.append("add rdi, 1 \n\t");
        cmd.append(saveContext());
        cmd.append("call puts\n\t");
        cmd.append(resumeContext());
        /*StringBuffer cmd=new StringBuffer();
        cmd.append("mov rdi, formatln\n\t");
        cmd.append("mov rsi,"+ varName(var) +" \n\t");
        cmd.append("add rsi, 1 \n\t");
        cmd.append("xor rax, rax\n\t");
        cmd.append("call printf\n\t");*/
        return  cmd;
    }
    StringBuffer print(Variable var) {
        StringBuffer cmd=new StringBuffer();
        cmd.append("mov rdi, format\n\t");
        cmd.append("mov rsi,"+ varName(var) +" \n\t");
        cmd.append("add rsi, 1 \n\t");
        cmd.append("xor rax, rax\n\t");
        cmd.append(saveContext());
        cmd.append("call printf\n\t");
        cmd.append(resumeContext());
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
    static final int registerNum=3;
    HashMap<Integer,String>regName=new HashMap<Integer, String>();
    void kick(int x){

        if(writeBack[x]) {
            if (!isConst(occ[x]))
                text.append(new StringBuffer("mov qword " + varName(occ[x]) + "," + regName.get(x) + "\n\t"));
        }
        writeBack[x]=false;
        free[x]=true;
        occ[x]=null;
    }
    void kick(Variable var){
        for(int i=2;i<2+registerNum;i++){
            if(!free[i]&&occ[i].equals(var))
                kick(i);
        }
    }
    void kickAll(){
        for(int i=2;i<2+registerNum;i++)if(!free[i])
            kick(i);
    }
    void kickLocal(){
        //symbolMap.globalVariableMap.containsKey(variable.name)
        for(int i=0;i<2+registerNum;i++)if(!free[i]){
            if(symbolMap.globalVariableMap.containsKey(occ[i].name)){
                kick(i);
            }else{
                free[i]=true;
            }

        }
    }
    void clearAll(){
        for(int i=0;i<8+registerNum;i++){
            free[i]=true;
        }
    }

    void unlock(){
        for(int i=2;i<2+registerNum;i++){
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

        int mn=2000000000;
        int mx=-1;
        for(int i=2;i<2+registerNum;i++){
            if(ban[i])continue;
            if(variableLastIndex.get(occ[i])<currentLine){
                if(occ[i].isTemp)
                   writeBack[i]=false;
                pos=i;
                break;
            }
            if(lastUsedTime[i]<mn){
                mn=lastUsedTime[i];
                pos=i;
            }
            /*if(variableLastIndex.get(occ[i])>mx){
                mx=variableLastIndex.get(occ[i]);
                pos=i;
            }*/
        }

        kick(pos);

        return pos;
    }
    void put(int i,Variable var,boolean read){
        if(read) {
            if (isConst(var)) {
                text.append(new StringBuffer("mov " + regName.get(i) + "," + varName(var) + "\n\t"));
            } else {
                text.append(new StringBuffer("mov " + regName.get(i) + ",  " + varName(var) + "\n\t"));
            }
        }else{
            writeBack[i]=true;
        }
        free[i]=false;
        occ[i]=var;
        ban[i]=true;
        lastUsedTime[i]=currentLine;
    }
    boolean inReg(Variable var){
        for(int i=2;i<2+registerNum;i++){
            if(!free[i]&&occ[i].equals(var)) {
                return true;
            }
        }
        return false;
    }
    boolean fullReg(){
        for(int i=2;i<2+registerNum;i++){
            if(free[i]) {
                return false;
            }
        }
        return true;
    }

    int getRegister(Variable var,boolean read){
        if(var.register>0){
            return 16-var.register;
        }
        if(symbolMap.argVariableMap.containsKey(var.name)) {
            if (var.constValue == 0)
                return 0;
            if (var.constValue == 1)
                return 1;
        }
        for(int i=2;i<2+registerNum;i++){
            if(!free[i]&&occ[i].equals(var)) {
                ban[i]=true;
                lastUsedTime[i]=currentLine;
                if(!read)
                    writeBack[i]=true;
                return i;
            }
        }
        for(int i=2;i<2+registerNum;i++){
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
        int reg=getRegister(var,true);
        if(regName.containsKey(reg))
            return regName.get(reg);
        return "r"+reg;
    }
    String writeReg(Variable var){
        int reg=getRegister(var,false);
        if(regName.containsKey(reg))
            return regName.get(reg);
        return "r"+reg;
    }
    String readReg(Variable var){
        int reg=getRegister(var,true);
        if(regName.containsKey(reg))
            return regName.get(reg);
        return "r"+reg;
    }

    StringBuffer saveContext(){
        StringBuffer text=new StringBuffer();
        //text.append(new StringBuffer("push r15"+"\n\t"));
        //text.append(new StringBuffer("push r14"+"\n\t"));
        //text.append(new StringBuffer("push r13"+"\n\t"));
        //text.append(new StringBuffer("push r12"+"\n\t"));
        text.append(new StringBuffer("push r11"+"\n\t"));
        text.append(new StringBuffer("push r10"+"\n\t"));
        text.append(new StringBuffer("push r9"+"\n\t"));
        text.append(new StringBuffer("push r8"+"\n\t"));

        return text;
    }
    StringBuffer resumeContext(){
        StringBuffer text=new StringBuffer();

        text.append(new StringBuffer("pop r8"+"\n\t"));
        text.append(new StringBuffer("pop r9"+"\n\t"));
        text.append(new StringBuffer("pop r10"+"\n\t"));
        text.append(new StringBuffer("pop r11"+"\n\t"));
        //text.append(new StringBuffer("pop r12"+"\n\t"));
        //text.append(new StringBuffer("pop r13"+"\n\t"));
        //text.append(new StringBuffer("pop r14"+"\n\t"));
        //text.append(new StringBuffer("pop r15"+"\n\t"));
        return text;
    }
    void run(String fileName)throws Exception{
        HashMap<String,String>lowbit=new HashMap<String, String>();
        lowbit.put("rax","al");
        lowbit.put("rbx","bl");
        lowbit.put("rcx","cl");
        lowbit.put("rdx","dl");
        lowbit.put("r8","r8B");
        lowbit.put("r9","r9B");
        lowbit.put("r10","r10B");
        lowbit.put("r11","r11B");
        lowbit.put("r12","r12B");
        lowbit.put("r13","r13B");
        lowbit.put("r14","r14B");
        lowbit.put("r15","r15B");

        regName.put(0,"rdi");
        regName.put(1,"rsi");
        //regName.put(2,"rax");
        //regName.put(3,"rax");
        //regName.put(4,"rax");
        //regName.put(5,"rax");
        //regName.put(6,"rax");
        //regName.put(7,"rax");
        regName.put(2,"rbx");
        regName.put(3,"rdx");
        regName.put(4,"rax");

        regName.put(8,"r8");
        regName.put(9,"r9");
        regName.put(10,"r10");
        regName.put(11,"r11");
        regName.put(12,"r12");
        regName.put(13,"r13");
        regName.put(14,"r14");
        regName.put(15,"r15");

        HashMap<Integer,Integer>two=new HashMap<Integer, Integer>();
        for(int i=1;i<20;i++)
            two.put(1<<i,i);
        IROptimizer irOptimizer=new IROptimizer();
        ir=irOptimizer.optimize(ir);
        HashMap<Integer,HashSet<Integer>>saveRegister=irOptimizer.saveRegister;
        for(int i=0;i<8+registerNum;i++) {
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
        head.append("\t extern    calloc\n");
        head.append("\t extern    strlen\n");
        head.append("\t extern    strcmp\n");
        head.append("\t extern    memset\n");
        head.append("\t extern    memcpy\n");
        head.append("\t extern    sprintf\n");
        text.append("\t section   .text\n");
        bss.append("\t section   .bss\n");
        data.append("\t section   .data\n");

        for(Quad cur=ir.head;cur!=null;cur=cur.next) {
            currentLine++;
            putVariable(cur.var1);
            putVariable(cur.var2);
            putVariable(cur.dest);
        }

        ArrayList<Variable>variables=new ArrayList<Variable>(variableIndex.keySet());

        variables.sort((var1,var2)->{
            return var1.register!=var2.register?var1.register-var2.register:variableFirstIndex.get(var1)-variableFirstIndex.get(var2);
        });
        
        variableIndex.clear();
        for(Variable var : variables)
            variableIndex.put(var,variableIndex.size()+1);

        bss.append("gbl:         resb   "+Integer.toString(variableIndex.size()*8+2048)+"\n");
        bss.append("buff.1788:\n" +
                "        resb    256\n");
        bss.append("arg:\n" +
                "        resb    1024\n");
        bss.append("\n" +
                "trsp:         resb   1024\n");
        bss.append("s.1809:\n" +
                "        resb    1\n" +
                "\n" +
                "ML_31:\n" +
                "        resb    319\n");
        bss.append("mem.1758:\n" +
                "        resb    536870912");

        data.append(new StringBuffer("\nformatln:\n\t"));
        data.append(new StringBuffer("db  \"%s\", 10, 0\n\t"));
        data.append(new StringBuffer("\nformat:\n\t"));
        data.append(new StringBuffer("db  \"%s\",  0\n\t"));
        data.append(new StringBuffer("\nGS_31:\n\t"));
        data.append(new StringBuffer("db 25H, 6CH, 64H, 00H\n\t"));
        data.append(new StringBuffer("\nGS_32:\n\t"));
        data.append(new StringBuffer("db 25H, 73H, 00H\n\t"));
        data.append(new StringBuffer("ML_32:\n" +
                "        db 25H, 6CH, 64H, 00H\n"));

        for(Map.Entry<Variable,String> entry : constStringPool.entrySet()){
            String string=entry.getValue();
            data.append("\n"+entry.getKey()+":\n\t db "+ Integer.toString(format_length(string))+","+format(string) +" ,0\n");
            //variableMap.put(entry.getKey(),allocateString(string.substring(1,string.length()-1)));
        }

        text.append(ConstantPool.myallocFunction).append("\n");
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
        currentLine=0;
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
                    if(writeReg(dest).equals(readReg(var1))){
                        text.append(new StringBuffer("cmp "+readReg(var1)+", 0\n\t"));
                        text.append(new StringBuffer("sete "+lowbit.get(writeReg(dest))+"\n\t"));
                    }else{
                        text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                        text.append(new StringBuffer("cmp "+readReg(var1)+", 0\n\t"));
                        text.append(new StringBuffer("sete "+lowbit.get(writeReg(dest))+"\n\t"));
                    }
                    break;
                case inverse:
                    readReg(var1);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("not "+writeReg(dest)+"\n\t"));
                    break;
                case negate:
                    readReg(var1);
                    text.append(new StringBuffer("mov "+writeReg(dest)+","+readReg(var1)+"\n\t"));
                    text.append(new StringBuffer("neg "+writeReg(dest)+"\n\t"));
                    //kickAll();
                    break;
                case add:
                    readReg(var1);
                    readReg(var2);
                    if(writeReg(dest).equals(readReg(var1))){
                        text.append(new StringBuffer("add " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }else
                    if(writeReg(dest).equals(readReg(var2))){
                        text.append(new StringBuffer("add " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                    }else {
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("add " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }
                    break;
                case subtract:
                    //if(inReg(var2) ||!fullReg()) {
                    readReg(var1);
                    readReg(var2);
                    if(writeReg(dest).equals(readReg(var1))){
                        text.append(new StringBuffer("sub " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }else
                    if(writeReg(dest).equals(readReg(var2))){
                        text.append(new StringBuffer("sub " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("neg " + writeReg(dest) + "\n\t"));
                    }else {
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("sub " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }
                    /*}else{
                        readReg(var1);
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("sub " + writeReg(dest) + "," + varName(var2) + "\n\t"));
                    }*/
                    //kickAll();
                    //text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    //text.append(new StringBuffer("sub r8, "+varName(var2)+"\n\t"));
                    //text.append(new StringBuffer("mov qword "+varName(dest)+",r8 \n\t"));
                    break;
                case multiply:
                    readReg(var1);
                    readReg(var2);
                    if(writeReg(dest).equals(readReg(var1))){
                        text.append(new StringBuffer("imul " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }else
                    if(writeReg(dest).equals(readReg(var2))){
                        text.append(new StringBuffer("imul " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                    }else {
                        if(var2.type.equals(VariableType.CONST_INT)&&two.containsKey(var2.constValue)){
                            text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                            text.append(new StringBuffer("shl " + writeReg(dest) + "," + two.get(var2.constValue) + "\n\t"));
                        }else {
                            text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                            text.append(new StringBuffer("imul " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                        }
                    }
                    //kickAll();
                    break;
                case divide:
                    kickAll();
                    text.append(new StringBuffer("xor rdx, rdx\n\t"));
                    text.append(new StringBuffer("mov rax, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rbx, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cdq\n\t"));
                    text.append(new StringBuffer("idiv ebx\n\t"));
                    text.append(new StringBuffer("mov "+varName(dest)+", rax\n\t"));
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
                    kickAll();
                    //It's worth 1.3 pt
                    if(false && var2.type.equals(VariableType.CONST_INT)&&(var2.constValue==199 || var2.constValue==3000000)){
/*
                        text.append(new StringBuffer("mov rcx, " + varName(var1) + "\n\t"));

                        if(var2.constValue==199) {
                            text.append(new StringBuffer("        mov     rdx, qword 5254E78ECB419BA9H\n" +
                                    "        mov     rax, rcx\n" +
                                    "        imul    rdx\n" +
                                    "        sar     rdx, 6\n" +
                                    "        mov     rax, rcx\n" +
                                    "        sar     rax, 63\n" +
                                    "        sub     rdx, rax\n" +
                                    "        mov     rax, rdx\n" +
                                    "        imul    rax, rax, 199\n" +
                                    "        sub     rcx, rax\n" +
                                    "        mov     rax, rcx \n\t"));
                        }else{
                            text.append(new StringBuffer("        mov     rdx, qword 0B2F4FC0794908CF3H\n" +
                                    "        mov     rax, rcx\n" +
                                    "        imul    rdx\n" +
                                    "        lea     rax, [rdx+rcx]\n" +
                                    "        sar     rax, 21\n" +
                                    "        mov     rdx, rax\n" +
                                    "        mov     rax, rcx\n" +
                                    "        sar     rax, 63\n" +
                                    "        sub     rdx, rax\n" +
                                    "        mov     rax, rdx\n" +
                                    "        imul    rax, rax, 3000000\n" +
                                    "        sub     rcx, rax\n" +
                                    "        mov     rax, rcx \n\t"));

                        }
                        text.append(new StringBuffer("mov " + varName(dest) + ", rax\n\t"));
*/
                    }else {

                        text.append(new StringBuffer("xor rdx, rdx\n\t"));
                        text.append(new StringBuffer("mov rax, " + varName(var1) + "\n\t"));
                        text.append(new StringBuffer("mov rbx, " + varName(var2) + "\n\t"));
                        text.append(new StringBuffer("cdq\n\t"));
                        text.append(new StringBuffer("idiv ebx\n\t"));
                        text.append(new StringBuffer("mov " + varName(dest) + ", rdx\n\t"));
                    }
                    //kickAll();
                    break;
                case and:
                    readReg(var1);
                    readReg(var2);
                    if(writeReg(dest).equals(readReg(var1))){
                        text.append(new StringBuffer("and " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }else
                    if(writeReg(dest).equals(readReg(var2))){
                        text.append(new StringBuffer("and " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                    }else {
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("and " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }
                    //kickAll();
                    break;
                case or:
                    readReg(var1);
                    readReg(var2);
                    if(writeReg(dest).equals(readReg(var1))){
                        text.append(new StringBuffer("or " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }else
                    if(writeReg(dest).equals(readReg(var2))){
                        text.append(new StringBuffer("or " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                    }else {
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("or " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }
                    //kickAll();
                    break;
                case xor:
                    readReg(var1);
                    readReg(var2);
                    if(writeReg(dest).equals(readReg(var1))){
                        text.append(new StringBuffer("xor " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }else
                    if(writeReg(dest).equals(readReg(var2))){
                        text.append(new StringBuffer("xor " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                    }else {
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("xor " + writeReg(dest) + "," + readReg(var2) + "\n\t"));
                    }
                    //kickAll();
                    break;
                case shiftLeft://maybe wrong TODO
                    if(isConst(var2)){
                        readReg(var1);
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("mov rcx" + "," + Integer.valueOf(var2.constValue) + "\n\t"));
                        text.append(new StringBuffer("shl " + writeReg(dest) + ",cl\n\t"));
                    }else
                    if(dest.equals(var1)){
                        readReg(var1);
                        readReg(var2);
                        text.append(new StringBuffer("mov rcx" + "," + readReg(var2) + "\n\t"));
                        text.append(new StringBuffer("shl " + writeReg(var1) + ",cl\n\t"));
                    }else {
                        readReg(var1);
                        readReg(var2);
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("mov rcx" + "," + readReg(var2) + "\n\t"));
                        text.append(new StringBuffer("shl " + writeReg(dest) + ",cl\n\t"));
                    }
                    //kickAll();
                    break;
                case shiftRight:
                    if(dest.equals(var1)){
                        readReg(var1);
                        readReg(var2);
                        text.append(new StringBuffer("mov rcx" + "," + readReg(var2) + "\n\t"));
                        text.append(new StringBuffer("shr " + writeReg(var1) + ",cl\n\t"));
                    }else {
                        readReg(var1);
                        readReg(var2);
                        text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));
                        text.append(new StringBuffer("mov rcx" + "," + readReg(var2) + "\n\t"));
                        text.append(new StringBuffer("shr " + writeReg(dest) + ",cl\n\t"));
                    }
                    break;
                case move:
                    text.append(new StringBuffer("mov " + writeReg(dest) + "," + readReg(var1) + "\n\t"));

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

                    ArrayList<String>registers=new ArrayList<String >();
                    if(saveRegister.containsKey(cur.line))
                    for(int reg : saveRegister.get(cur.line))
                        registers.add(regName.get(16-reg));

                    //registers.add("r8");
                    //registers.add("r9");
                    //registers.add("r10");
                    //registers.add("r11");
                    //registers.add("r12");
                    //registers.add("r13");
                    //registers.add("r14");
                    //registers.add("r15");

                    for(String reg : registers)
                        text.append(new StringBuffer("push "+reg+"\n\t"));

                    text.append(new StringBuffer("call "+name+"\n\t"));

                    Collections.reverse(registers);
                    for(String reg : registers)
                        text.append(new StringBuffer("pop "+reg+"\n\t"));

                    clearAll();
                    text.append(new StringBuffer("mov "+writeReg(dest)+" , rax\n\t"));

                    break;
                case ret:
                    text.append(new StringBuffer("mov rax," +readReg(var1)+"\n\t"));
                    //kickAll();
                    kickLocal();
                    if(name.equals("main")){
                        text.append("        mov     rsp, qword [trsp]\n\t");
                    }
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
                    text.append(new StringBuffer("setl "+lowbit.get(writeReg(dest))+"\n\t"));
                    //kickAll();


                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setl "+varName(dest)+"\n\t"));*/

                    break;
                case leq:
                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setle "+lowbit.get(writeReg(dest))+"\n\t"));
                    //kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setle "+varName(dest)+"\n\t"));*/
                    break;
                case equal:


                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("sete "+lowbit.get(writeReg(dest))+"\n\t"));

                    //kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("sete "+varName(dest)+"\n\t"));
                    */break;
                case inequal:
                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setne "+lowbit.get(writeReg(dest))+"\n\t"));
                    //kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setne "+varName(dest)+"\n\t"));
                    */break;
                case geq:
                    text.append(new StringBuffer("cmp "+ readReg(var1)+","+readReg(var2)+"\n\t"));
                    text.append(new StringBuffer("mov "+writeReg(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setge "+lowbit.get(writeReg(dest))+"\n\t"));
                    //kickAll();
                    /*text.append(new StringBuffer("mov r8, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov r9, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp r8, r9\n\t"));
                    text.append(new StringBuffer("mov qword "+varName(dest)+", 0\n\t"));
                    text.append(new StringBuffer("setge "+varName(dest)+"\n\t"));*/
                    break;
                case greater:
                    if(isConst(var2)){
                        text.append(new StringBuffer("cmp " + readReg(var1) + "," + Integer.toString(var2.constValue) + "\n\t"));
                        text.append(new StringBuffer("mov " + writeReg(dest) + ", 0\n\t"));
                        text.append(new StringBuffer("setg " + lowbit.get(writeReg(dest))+"\n\t"));
                    }else {
                        text.append(new StringBuffer("cmp " + readReg(var1) + "," + readReg(var2) + "\n\t"));
                        text.append(new StringBuffer("mov " + writeReg(dest) + ", 0\n\t"));
                        text.append(new StringBuffer("setg " + lowbit.get(writeReg(dest))+"\n\t"));
                    }
                    //kickAll();
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
                    text.append(saveContext());
                    text.append(new StringBuffer("call    strls\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strleq:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    strle\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strequal:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    streq\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strinequal:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    strne\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strgeq:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    strge\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov qword "+varName(dest)+", rax\n\t"));
                    break;
                case strgreater:
                    kickAll();
                    text.append(new StringBuffer("mov rdi, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rsi, "+varName(var2)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    strgt\n\t"));
                    text.append(resumeContext());
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
                    text.append(new StringBuffer("mov rdx, "+varName(var1)+"\n\t"));
                    text.append(new StringBuffer("mov rbx, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("cmp rdx, rbx\n\t"));
                    text.append(new StringBuffer("jne "+varName(dest)+"\n\t"));
                    break;
                case malloc:
                    /*kickAll();
                    text.append(new StringBuffer(
                                    "mov     rdi, "+readReg(var1)+"\n\t" +
                                    "call    malloc\n\t"+
                                    "mov     qword "+writeReg(dest)+", rax\n\t"));
                    clearAll();*/
                    break;
                case mallocArray:

                    kickAll();
                    text.append(new StringBuffer("mov     rdi, "+varName(var1)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    mallocArray\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov     qword "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case concat:
                    kickAll();
                    text.append(new StringBuffer("mov     rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov     rdi, "+varName(var1)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    concat\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case load:
                    //getReg(var1);
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
                    text.append(new StringBuffer("lea "+writeReg(dest)+",["+readReg(var1)+"+"+readReg(var2)+"*8+8H]\n\t"));
//lea     rax, [rdi+rsi*8+8H]
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
                    text.append(saveContext());
                    text.append(new StringBuffer("call    getString\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov     "+ varName(dest) +", rax\n\t"));
                    clearAll();
                    break;
                case getInt:
                    kickAll();
                    text.append(saveContext());
                    text.append(new StringBuffer("call    getInt\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov     "+ varName(dest) +", rax\n\t"));
                    clearAll();
                    break;
                case toString:
                    kickAll();
                    text.append(new StringBuffer("mov     rdi, "+varName(var1)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    toString\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov     qword"+varName(dest)+", rax\n\t"));
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

                    if(name.equals("main")){
                        text.append(new StringBuffer("mov     rax, 936870912\n" +
                                "        cdqe\n" +
                                "        mov     rdi, rax\n" ));
                        text.append(new StringBuffer("        call    malloc\n"));
                        text.append(new StringBuffer("\t        mov rbx,0\n" +
                                "\t        mov rsi,0\n" +
                                "\t        mov rdi,0\n" +
                                "\t        mov rcx,0\n" +
                                "\t        mov rdx,0\n" +
                                "\t\t\tmov r8,0\n" +
                                "\t\t\tmov r9,0\n" +
                                "\t\t\tmov r10,0\n" +
                                "\t\t\tmov r11,0\n" +
                                "\t\t\tmov r12,0\n" +
                                "\t\t\tmov r13,0\n" +
                                "\t\t\tmov r14,0\n" +
                                "\t\t\tmov r15,0\n"));
                        text.append(new StringBuffer("        mov     edx, dword 936870912\n" +
                                "        movsxd  rdx, edx\n" +
                                "        sub     rdx, "+Integer.toString(variableIndex.size()*8+2048)+"\n" +
                                "        add     rax, rdx\n" +
                                "        mov     qword [trsp], rsp\n" +
                                "        mov     rsp, rax\n" +
                                "        mov     eax, 0\n\t"));
                    }
                    break;
                case endContext:
                    break;
                case multiArray:
                    kickAll();
                    text.append(new StringBuffer("mov     rdi, "+varName(var1)+"\n\t"));
                    //text.append(saveContext());
                    text.append(new StringBuffer("call    multiArray\n\t"));
                    //text.append(resumeContext());
                    text.append(new StringBuffer("mov     qword "+varName(dest)+", rax\n\t"));
                    //clearAll();
                    break;
                case multiAddress:
                    kickAll();
                    text.append(new StringBuffer("mov     rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov     rdi, "+varName(var1)+"\n\t"));
                    //text.append(saveContext());
                    text.append(new StringBuffer("call    multiAddress\n\t"));
                   // text.append(resumeContext());
                    text.append(new StringBuffer("mov "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case substring:
                    kickAll();
                    text.append(new StringBuffer("mov     rsi, "+varName(var2)+"\n\t"));
                    text.append(new StringBuffer("mov     rdi, "+varName(var1)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    substring\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case parseInt:
                    kickAll();
                    text.append(saveContext());
                    text.append(new StringBuffer("call    parseInt\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov     qword "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;
                case ord:
                    kickAll();
                    text.append(new StringBuffer("mov     rdi, "+varName(var1)+"\n\t"));
                    text.append(saveContext());
                    text.append(new StringBuffer("call    ord\n\t"));
                    text.append(resumeContext());
                    text.append(new StringBuffer("mov     qword "+varName(dest)+", rax\n\t"));
                    clearAll();
                    break;

            }
        }


        result=head.append("\n").append(text).append("\n").append(bss).append("\n").append(data).append("\n");
        result.append("SECTION .data.rel.local align=8\n" +
                "\n" +
                "cur.1759: dq mem.1758\n");
        PrintWriter output = new PrintWriter(new FileOutputStream(new File(fileName)));
        output.println(result.toString());
        output.close();
        //System.err.println(result);
        return ;
    }

}

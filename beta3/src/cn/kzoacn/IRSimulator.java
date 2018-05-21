package cn.kzoacn;



import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Stack;

public class IRSimulator {

    IR ir;
    HashMap<Variable,String>constStringPool;

    void setSimulator(IR ir, HashMap<Variable,String>constStringPool){
        this.ir=ir;
        this.constStringPool=constStringPool;
    }
    IRSimulator(){}

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

    HashMap<Variable,Integer>variableMap=new HashMap<Variable,Integer>();
    HashMap<String,Quad>jumpMap=new HashMap<String, Quad>();
    byte[] memory=new byte[64*1024*1024];
    Stack<Integer>stack=new Stack<Integer>();
    Stack<Quad>jumpStack=new Stack<Quad>();
    int allocator=0;
    void put(Variable name,Integer value){
        variableMap.put(name,value);
    }
    int get(Variable name){

        return variableMap.get(name);
    }

    void init(Variable variable){
        if(variable==null || variable.equals(Variable.empty))
            return ;

        if(variableMap.containsKey(variable))
            return ;

        if(variable.type.name.equals("const_int"))
            put(variable,variable.constValue);
        else
            put(variable,0);
    }

    int allocateString(String string){
        int start=allocator;
        memory[allocator]=(byte)string.length();
        allocator+=1;
        for(int i=0;i<string.length();i++)
            memory[allocator+i]=(byte)string.charAt(i);
        allocator+=string.length();
        memory[allocator]=0;
        allocator+=1;
        return start;
    }

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

    StringBuffer run(){
        StringBuffer result=new StringBuffer();
        Quad cur=ir.head;

        while (cur!=null){
            init(cur.dest);
            init(cur.var1);
            init(cur.var2);
            if(cur.opCode.equals(OpCode.label))
                jumpMap.put(cur.name,cur);
            cur=cur.next;
        }
        for(Map.Entry<Variable,String> entry : constStringPool.entrySet()){
            String string=entry.getValue();
            variableMap.put(entry.getKey(),allocateString(string.substring(1,string.length()-1)));
        }

        cur=ir.head;
        Scanner cin = new Scanner(System.in);
        jumpStack.push(null);
        int line=0;


        try {


            while (cur != null) {
                line+=1;
                Variable dest = cur.dest;
                Variable var1 = cur.var1;
                Variable var2 = cur.var2;
                String name = cur.name;
                byte[] tmpArray=new byte[4];
              //  System.err.println(cur.opCode);
                switch (cur.opCode) {
                    case not:
                        put(dest, get(var1) == 0 ? 1 : 0);
                        cur = cur.next;
                        break;
                    case inverse:
                        put(dest, ~get(var1));
                        cur = cur.next;
                        break;
                    case negate:
                        put(dest, -get(var1));
                        cur = cur.next;
                        break;
                    case add:
                        put(dest, get(var1) + get(var2));
                        cur = cur.next;
                        break;
                    case subtract:
                        put(dest, get(var1) - get(var2));
                        cur = cur.next;
                        break;
                    case multiply:
                        put(dest, get(var1) * get(var2));
                        cur = cur.next;
                        break;
                    case divide:
                        put(dest, get(var1) / get(var2));
                        cur = cur.next;
                        break;
                    case mod:
                        put(dest, get(var1) % get(var2));
                        cur = cur.next;
                        break;
                    case and:
                        put(dest, get(var1) & get(var2));
                        cur = cur.next;
                        break;
                    case or:
                        put(dest, get(var1) | get(var2));
                        cur = cur.next;
                        break;
                    case xor:
                        put(dest, get(var1) ^ get(var2));
                        cur = cur.next;
                        break;
                    case shiftLeft:
                        put(dest, get(var1) << get(var2));
                        cur = cur.next;
                        break;
                    case shiftRight:
                        put(dest, get(var1) >> get(var2));
                        cur = cur.next;
                        break;
                    case move:
                        put(dest, get(var1));
                        cur = cur.next;
                        break;
                    case push:
                        stack.push(get(var1));
                        cur = cur.next;
                        break;
                    case pop:
                        put(dest, stack.peek());
                        cur = cur.next;
                        stack.pop();
                        break;
                    case call:
                        jumpStack.push(cur.next);
                        cur = jumpMap.get(name);
                        break;
                    case ret:
                        cur = jumpStack.peek();
                        jumpStack.pop();
                        break;
                    case label:
                        jumpMap.put(name, cur);
                        cur = cur.next;
                        break;
                    case less:
                        put(dest, get(var1) < get(var2) ? 1 : 0);
                        cur = cur.next;
                        break;
                    case leq:
                        put(dest, get(var1) <= get(var2) ? 1 : 0);
                        cur = cur.next;
                        break;
                    case equal:
                        put(dest, get(var1) == get(var2) ? 1 : 0);
                        cur = cur.next;
                        break;
                    case inequal:
                        put(dest, get(var1) != get(var2) ? 1 : 0);
                        cur = cur.next;
                        break;
                    case geq:
                        put(dest, get(var1) >= get(var2) ? 1 : 0);
                        cur = cur.next;
                        break;
                    case greater:
                        put(dest, get(var1) > get(var2) ? 1 : 0);
                        cur = cur.next;
                        break;
                    case jmp:
                        cur = jumpMap.get(name);
                        break;
                    case jz:
                        if (get(var1) == 0)
                            cur = jumpMap.get(name);
                        else
                            cur = cur.next;
                        break;
                    case jnz:
                        if (get(var1) != 0)
                            cur = jumpMap.get(name);
                        else
                            cur = cur.next;
                        break;
                    case jne:

                        if (get(var1) != get(var2))
                            cur = jumpMap.get(name);
                        else
                            cur = cur.next;
                        break;
                    case malloc:
                        put(dest, allocator);
                        allocator += get(var1);
                        cur = cur.next;
                        break;
                    case load:
                        int d=get(var1);
                        tmpArray[3]=memory[d+3];
                        tmpArray[2]=memory[d+2];
                        tmpArray[1]=memory[d+1];
                        tmpArray[0]=memory[d];
                        put(dest, byteArrayToInt(tmpArray));
                        cur = cur.next;
                        break;
                    case store:
                        int t = get(var1);
                        d = get(dest);
                        tmpArray=intToByteArray(t);

                        memory[d]=tmpArray[0];
                        memory[d+1]=tmpArray[1];
                        memory[d+2]=tmpArray[2];
                        memory[d+3]=tmpArray[3];

                        cur = cur.next;
                        break;
                    case print:
                        for (int i = get(var1) + 1; memory[i] != 0; i++) {
                            result.append((char) memory[i]);
                            System.out.print((char) memory[i]);
                        }
                        cur = cur.next;
                        break;
                    case println:
                        for (int i = get(var1) + 1; memory[i] != 0; i++) {
                            result.append((char) memory[i]);
                            System.out.print((char) memory[i]);
                        }
                        result.append('\n');
                        System.out.println();
                        cur = cur.next;
                        break;
                    case getString:
                        cur = cur.next;
                        //TODO

                        break;
                    case getInt:
                        cur = cur.next;
                        //TODO
                        break;
                    case toString:
                        String string = Integer.toString(get(var1));
                        put(dest, allocateString(string));
                        cur = cur.next;
                        break;
                    case address:
                        put(dest, get(var1) + get(var2)*4+4);
                        cur = cur.next;
                        break;
                    case mallocArray:
                        put(dest, allocator);

                        tmpArray=intToByteArray(get(var1));

                        memory[allocator]=tmpArray[0];
                        memory[allocator+1]=tmpArray[1];
                        memory[allocator+2]=tmpArray[2];
                        memory[allocator+3]=tmpArray[3];


                        allocator += (4*get(var1)+4);

                        cur = cur.next;
                        break;
                    case concat:
                        StringBuffer tmp=new StringBuffer();
                        for (int i = get(var1) + 1; memory[i] != 0; i++) {
                            tmp.append((char) memory[i]);
                        }
                        for (int i = get(var2) + 1; memory[i] != 0; i++) {
                            tmp.append((char) memory[i]);
                        }
                        put(dest,allocateString(tmp.toString()));
                        cur = cur.next;

                        break;
                    case saveContext:
                        cur=cur.next;
                        break;
                    case resumeContext:
                        cur=cur.next;
                        break;
                    case enterFunction:
                        cur=cur.next;
                        break;
                    case exitFunction:
                        cur=cur.next;
                        break;
                    case endContext:
                        cur=cur.next;
                        break;
                }
            }
        }catch (Exception e){
            System.err.println("Simulate Error at line "+line);
        }
        return result;
    }
}

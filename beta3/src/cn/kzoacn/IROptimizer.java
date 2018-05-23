package cn.kzoacn;

import java.util.*;

public class IROptimizer {

    IR optimize(IR ir){
        ArrayList<ArrayList<Integer> >edgeList=new ArrayList<ArrayList<Integer> >();
        IR tmp=new IR();
        Quad cur=ir.head;
        int line_number=0;
        HashMap<String,Integer>lineMap=new HashMap<String, Integer>();
        while(cur!=null){
            cur.line=line_number++;
            edgeList.add(new ArrayList<Integer>());
            if(cur.opCode==OpCode.label)
                lineMap.put(cur.name,cur.line);
            cur=cur.next;
        }
        cur=ir.head;
       // ir.print();
        while(cur!=null){
            switch (cur.opCode){
                case jmp:
                    edgeList.get(cur.line).add(lineMap.get(cur.name));
                    break;

                case jz:
                    if(cur.line+1<line_number)
                        edgeList.get(cur.line).add(cur.line+1);
                    edgeList.get(cur.line).add(lineMap.get(cur.name));
                    break;
                case jnz:
                    if(cur.line+1<line_number)
                        edgeList.get(cur.line).add(cur.line+1);
                    edgeList.get(cur.line).add(lineMap.get(cur.name));
                    break;
                case jne:
                    if(cur.line+1<line_number)
                        edgeList.get(cur.line).add(cur.line+1);
                    edgeList.get(cur.line).add(lineMap.get(cur.name));
                    break;
                case ret:
                    break;
                case call:
                    if(cur.line+1<line_number)
                        edgeList.get(cur.line).add(cur.line+1);
                    edgeList.get(cur.line).add(lineMap.get(cur.name));
                    break;

                default:
                    if(cur.line+1<line_number)
                        edgeList.get(cur.line).add(cur.line+1);
                    break;

            }
            cur=cur.next;
        }
        boolean[] visit=new boolean[line_number];
        for(int i=0;i<visit.length;i++)
            visit[i]=false;
        int s=lineMap.get("main");
        LinkedList<Integer> queue=new LinkedList<Integer>();
        queue.push(s);visit[s]=true;
        while(!queue.isEmpty()){
            int u=queue.getFirst();queue.removeFirst();
            for(int v : edgeList.get(u)){
                if(visit[v])continue;
                visit[v]=true;
                queue.push(v);
            }
        }

        cur=ir.head;
        while(cur!=null){
            if(visit[cur.line])
                tmp.push(cur.clone());
            cur=cur.next;
        }
        ir=tmp;
        tmp=new IR();


        HashSet<String>usedLabel=new HashSet<String>();
        cur=ir.head;
        while(cur!=null){
            boolean flag=true;
            if(cur.next!=null&&cur.opCode==OpCode.jmp){
                if(cur.next.opCode==OpCode.label){
                    if(cur.name.equals(cur.next.name)){
                        flag=false;
                    }
                }
            }
            if(flag) {
                tmp.push(cur);
                if(cur.opCode!=OpCode.label&&cur.name!=null)
                    usedLabel.add(cur.name);
            }
            cur=cur.next;
        }


        ir=tmp;
        tmp=new IR();


        cur=ir.head;
        while(cur!=null){
            if(cur.opCode==OpCode.label&&!usedLabel.contains(cur.name)){

            }else{
                tmp.push(cur);
            }
            cur=cur.next;
        }


        System.err.println("----------------------------------------------");
        tmp.print();
        System.err.println("----------------------------------------------");

        return tmp;
    }
}

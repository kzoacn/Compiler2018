package cn.kzoacn;

import java.util.*;

public class IROptimizer {

    IR optimize(IR ir){
        ArrayList<ArrayList<Integer> >edgeList=new ArrayList<ArrayList<Integer> >();
        IR tmp=new IR();
        Quad cur=ir.head;
        int line_number=0;
        HashMap<String,Integer>lineMap=new HashMap<String, Integer>();
        HashSet<Variable>variables=new HashSet<Variable>();
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
        ir=tmp;
        edgeList=new ArrayList<ArrayList<Integer> >();
        cur=ir.head;
        line_number=0;
        ArrayList<HashSet<Variable> >def,use,in,out;
        def=new ArrayList<HashSet<Variable> >();
        use=new ArrayList<HashSet<Variable> >();
        in=new ArrayList<HashSet<Variable> >();
        out=new ArrayList<HashSet<Variable> >();
        lineMap=new HashMap<String, Integer>();

        HashSet<String>gbl=new HashSet<String>();
        for(int i=0;i<128;i++) {
            gbl.add("t" + Integer.toString(i));
        }
        while(cur!=null){
            cur.line=line_number;
            edgeList.add(new ArrayList<Integer>());
            def.add(new HashSet<Variable>());
            use.add(new HashSet<Variable>());
            in.add(new HashSet<Variable>());
            out.add(new HashSet<Variable>());

            if(cur.dest!=null&&!cur.dest.equals(Variable.empty)) {
                if(cur.opCode!=OpCode.store)
                    def.get(line_number).add(cur.dest);
                variables.add(cur.dest);
                cur.dest.register=0;
                if(cur.dest.global)
                    gbl.add(cur.dest.name);
                if(cur.opCode==OpCode.store)
                    use.get(line_number).add(cur.dest);
            }
            if(cur.var1!=null&&!cur.var1.equals(Variable.empty)) {

                use.get(line_number).add(cur.var1);
                variables.add(cur.var1);
                cur.var1.register=0;
                if(cur.var1.global)
                    gbl.add(cur.var1.name);
            }
            if(cur.var2!=null&&!cur.var2.equals(Variable.empty)) {
                use.get(line_number).add(cur.var2);
                variables.add(cur.var2);
                cur.var2.register=0;
                if(cur.var2.global)
                    gbl.add(cur.var2.name);
            }
            if(cur.opCode==OpCode.label)
                lineMap.put(cur.name,cur.line);
            line_number++;
            cur=cur.next;
        }
        if(variables.size()>350){
            return ir;
        }
        //live analyze
        cur=ir.head;
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

        Date date=new Date();
        while(true){
            if((new Date()).getTime()-date.getTime()>24000)
                return ir;
            boolean flag=true;

            HashSet<Variable> nin;
            HashSet<Variable> nout;
            for(int i=0;i<line_number;i++){
                nin=new HashSet<Variable>();
                nout=new HashSet<Variable>();
                for(Variable var : use.get(i))
                    nin.add(var);
                for(Variable var : out.get(i))
                    if(!def.get(i).contains(var))
                        nin.add(var);
                for(int j : edgeList.get(i))
                    for(Variable var : in.get(j))
                        nout.add(var);
                if(!in.get(i).equals(nin) || !out.get(i).equals(nout))
                    flag=false;
                in.set(i,nin);
                out.set(i,nout);
            }

            if(flag)break;
        }




        //register allocate
        HashMap<Variable,HashSet<Variable> >graph=new HashMap<Variable,HashSet<Variable> >();
        HashMap<Variable,Integer>degree=new HashMap<Variable,Integer>();
        for(Variable var:variables)
            graph.put(var,new HashSet<Variable>());

        for(int i=0;i<line_number;i++){
            //System.err.println(i);
            for(Variable var1:in.get(i)){
                //System.err.print(var1.name+",");
                for(Variable var2:in.get(i)){
                    if(!var1.equals(var2)){
                        graph.get(var1).add(var2);
                    }
                }
            }
            for(Variable var1:out.get(i)){
                //System.err.print(var1.name+",");
                for(Variable var2:out.get(i)){
                    if(!var1.equals(var2)){
                        graph.get(var1).add(var2);
                    }
                }
            }
            for(Variable var1:def.get(i)){
                for(Variable var2:out.get(i)){
                    if(!var1.equals(var2)) {
                        graph.get(var1).add(var2);
                        graph.get(var2).add(var1);
                    }
                }
            }

            //System.err.println();
        }
        for(Variable var:variables){
            degree.put(var,graph.get(var).size());
        }
        visit=new boolean[10];

        ArrayList<Variable>color=new ArrayList<Variable>();


        //variables.removeIf((var)->var.isTemp);
        variables.removeIf((var)->gbl.contains(var.name));
        variables.removeIf((var)->var.type.name.contains("const") ||var.name.contains("const") || var.type.name.equals("null"));
        //variables.removeIf((var)->var.name.startsWith("t"));

        for(Variable var : variables){
            //if(var.name.equals("i"))color.add(var);
            //if(var.name.equals("j"))color.add(var);
            //if(var.name.equals("k"))color.add(var);
            //if(var.name.equals("n"))color.add(var);
            //if(var.name.equals("ans"))color.add(var);
        }
        for(Map.Entry<Variable,HashSet<Variable> > entry : graph.entrySet()){
            HashSet<Variable> hashSet=entry.getValue();
            hashSet.removeIf((var)->!variables.contains(var));
            degree.put(entry.getKey(),hashSet.size());
        }

        int registerNumber=5;


        TreeMap<String,Integer>colorMap=new TreeMap<String, Integer>();
        //greedy allocate


        for(Variable var:variables){
            for(int i=0;i<10;i++)visit[i]=false;
            for(Variable var2:graph.get(var))if(colorMap.containsKey(var2.name))
                visit[colorMap.get(var2.name)]=true;
            int mex=0;
            for(int i=1;i<10;i++){
                if(!visit[i]){
                    mex=i;
                    break;
                }
            }
            if(mex>registerNumber)mex=0;
            //if(used[mex])continue;
            if(mex>0)colorMap.put(var.name,mex);
        }
        for(Variable var:variables)if(!colorMap.containsKey(var.name)){
            for(int i=0;i<10;i++)visit[i]=false;
            for(Variable var2:graph.get(var))if(colorMap.containsKey(var2.name))
                visit[colorMap.get(var2.name)]=true;
            int mex=0;
            for(int i=1;i<10;i++){
                if(!visit[i]){
                    mex=i;
                    break;
                }
            }
            if(mex>registerNumber)mex=0;
            //if(used[mex])continue;
            if(mex>0)colorMap.put(var.name,mex);
        }
        /*
        while(variables.size()>0){
            ArrayList<Variable>newColor=new ArrayList<Variable>();
            for(Variable var : variables){
                if(degree.get(var)<registerNumber){
                    newColor.add(var);
                    color.add(var);
                }
            }
            if(!newColor.isEmpty()){
                for(Variable var : newColor){
                    variables.remove(var);
                    for(Variable near : graph.get(var)){
                        degree.put(near,degree.get(near)-1);
                    }
                }
                continue;
            }
            Variable lucky=null;
            int mx=0;
            for(Variable var : variables){
                lucky = var;
                //break;
            }

            variables.remove(lucky);
            for(Variable near : graph.get(lucky)){
                degree.put(near,degree.get(near)-1);
            }
        }

        boolean[] used=new boolean[10];
        for(int i=0;i<10;i++)used[i]=false;
        Collections.shuffle(color,new Random(3));
        for(Variable var:color){
            for(int i=0;i<10;i++)visit[i]=false;
            for(Variable var2:graph.get(var))if(colorMap.containsKey(var2.name))
                visit[colorMap.get(var2.name)]=true;
            int mex=0;
            for(int i=1;i<10;i++){
                if(!visit[i]){
                    mex=i;
                    break;
                }
            }
            if(mex>registerNumber)mex=0;
            //if(used[mex])continue;
            used[mex]=true;
            colorMap.put(var.name,mex);
        }
*/

        cur=ir.head;
        while(cur!=null){
            if(cur.dest!=null&&colorMap.containsKey(cur.dest.name))
                cur.dest.register=colorMap.get(cur.dest.name);
            if(cur.var1!=null&&colorMap.containsKey(cur.var1.name))
                cur.var1.register=colorMap.get(cur.var1.name);
            if(cur.var2!=null&&colorMap.containsKey(cur.var2.name))
                cur.var2.register=colorMap.get(cur.var2.name);
            cur=cur.next;
        }
        System.err.println("----------------------------------------------");
        tmp.print();
        System.err.println("----------------------------------------------");

        return tmp;
    }
}

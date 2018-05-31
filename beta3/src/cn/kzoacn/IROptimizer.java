package cn.kzoacn;

import java.util.*;

public class IROptimizer {
    public int registerNumber=8;
    public HashMap<Integer,HashSet<Integer> >saveRegister=new HashMap<Integer, HashSet<Integer>>();

    class Interval{
        int l,r;
        String name;
        public Interval(){
            l=r=-1;
        }
        public Interval(String n,int x){
            l=r=x;
            name=n;
        }
        public void upd(int x){
            if(l==-1){
                l=r=x;
            }else{
                l=Math.min(l,x);
                r=Math.max(r,x);
            }
        }
    };
    HashMap<String,Interval>liveInterval=new HashMap<String,Interval>();
    HashMap<Variable,Integer>degree=new HashMap<Variable,Integer>();
    HashSet<Variable>variables=new HashSet<Variable>();
    HashMap<Variable,HashSet<Variable> >graph=new HashMap<Variable,HashSet<Variable> >();
    TreeMap<String,Integer> linearScan(){

        TreeMap<String,Integer> colorMap=new TreeMap<String,Integer>();
        ArrayList<Interval> arrayList = new ArrayList<Interval>(liveInterval.values());
        HashSet<Interval>current=new HashSet<Interval>();
        arrayList.sort((l1,l2)->l1.l-l2.l==0?l1.r-l2.r:l1.l-l2.l);

        boolean[] visit=new boolean[10];

        for(Interval l : arrayList){
            current.removeIf((inter)->inter.r+2<l.l);
            int mx=-1;
            Interval lucky=new Interval();
            for(int i=0;i<10;i++)visit[i]=false;
            int mex=0;
            for(Interval l2:current) {
                visit[colorMap.get(l2.name)] = true;
                if(l2.r>mx){
                    mx=l2.r;
                    lucky=l2;
                }
            }
            for(int i=1;i<=registerNumber;i++)if(!visit[i]){
                mex=i;
                break;
            }
            if(mex>0){
                colorMap.put(l.name,mex);;
                current.add(l);
                continue;
            }
            colorMap.put(l.name,colorMap.get(lucky.name));
            colorMap.remove(lucky.name);
            current.remove(lucky);
            current.add(l);
        }

        return colorMap;
    }
    TreeMap<String,Integer> chartin(){
        ArrayList<Variable>color=new ArrayList<Variable>();
        TreeMap<String,Integer> colorMap=new TreeMap<String,Integer>();
        boolean[] visit=new boolean[10];

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
        variables.addAll(color);
//        Collections.shuffle(color,new Random(3));
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
            if(mex>0)colorMap.put(var.name,mex);
        }

        return colorMap;
    }
    TreeMap<String,Integer> greed(){
        TreeMap<String,Integer> colorMap=new TreeMap<String,Integer>();
        boolean[] visit=new boolean[10];
        ArrayList<Variable>arrayList=new ArrayList<Variable>(variables);
        arrayList.sort((var1, var2) -> graph.get(var2).size() - graph.get(var1).size());
        for(Variable var:arrayList){
            for(int i=0;i<10;i++)visit[i]=false;
            for(Variable var2:graph.get(var))if(colorMap.containsKey(var2.name)) {
                visit[colorMap.get(var2.name)] = true;
            }
            int mex=0;
            for(int i=1;i<10;i++){
                if(!visit[i]){
                    mex=i;
                    break;
                }
            }
            if(mex>registerNumber)mex=0;

            if(mex>0){
                colorMap.put(var.name,mex);
            }else{
                colorMap.remove(var.name);
            }

        }

        return colorMap;
    }

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
        for(int i=0;i<64;i++) {
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
        if(variables.size()>750){
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
            for(int i=line_number-1;i>=0;i--){
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
        for(Variable var:variables)
            graph.put(var,new HashSet<Variable>());

        for(int i=0;i<line_number;i++){
            //System.err.println(i);
            for(Variable var1:in.get(i))
                if(liveInterval.containsKey(var1.name)){
                    liveInterval.get(var1.name).upd(i);
                }else{
                    liveInterval.put(var1.name,new Interval(var1.name,i));
                }
            for(Variable var1:out.get(i))
                if(liveInterval.containsKey(var1.name)){
                    liveInterval.get(var1.name).upd(i);
                }else{
                    liveInterval.put(var1.name,new Interval(var1.name,i));
                }
            for(Variable var1:def.get(i))
                if(liveInterval.containsKey(var1.name)){
                    liveInterval.get(var1.name).upd(i);
                }else{
                    liveInterval.put(var1.name,new Interval(var1.name,i));
                }
            for(Variable var1:use.get(i))
                if(liveInterval.containsKey(var1.name)){
                    liveInterval.get(var1.name).upd(i);
                }else{
                    liveInterval.put(var1.name,new Interval(var1.name,i));
                }
            for(Variable var1:in.get(i)){
                //System.err.print(var1.name+",");
                for(Variable var2:in.get(i)){
                    if(!var1.equals(var2)){
                       // graph.get(var1).add(var2);
                    }
                }

            }
            for(Variable var1:out.get(i)){
                //System.err.print(var1.name+",");
                for(Variable var2:out.get(i)){
                    if(!var1.equals(var2)){
                       // graph.get(var1).add(var2);
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



        //variables.removeIf((var)->var.isTemp);
        variables.removeIf((var)->gbl.contains(var.name));
        variables.removeIf((var)->var.type.name.contains("const") ||var.name.contains("const") || var.type.name.equals("null"));
        //variables.removeIf((var)->var.name.startsWith("t"));
        HashMap<String,Interval> temp=new HashMap<String,Interval>();

        for(Variable var : variables){
            if(liveInterval.containsKey(var.name))
                temp.put(var.name,liveInterval.get(var.name));
        }
        liveInterval=temp;

        TreeMap<String,Integer>colorMap=new TreeMap<String, Integer>();
        for(Variable var : variables){
            //if(var.name.equals("i"))colorMap.put(var.name,1);
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




        //greedy allocate
        boolean[] used=new boolean[10];
        TreeMap<String,Integer> colorMap1=greed();
        TreeMap<String,Integer> colorMap2=chartin();
        //TreeMap<String,Integer> colorMap3=linearScan();


        System.err.println("greed : "+colorMap1.size());
        System.err.println("chartin : "+colorMap2.size());
        //System.err.println("linearScan : "+colorMap3.size());
        colorMap=colorMap1;
        if(colorMap1.size()>colorMap.size())
            colorMap=colorMap1;
        if(colorMap2.size()>colorMap.size())
            colorMap=colorMap2;
        cur=ir.head;
        line_number=0;


        for(Variable var:variables)if(colorMap.containsKey(var.name)){

            for(Variable var2:graph.get(var))if(colorMap.containsKey(var2.name))
                if(colorMap.get(var.name).equals(colorMap.get(var2.name))){
                    System.err.println(var.name+" "+var2.name);
                    System.err.println("sdf");
                }
        }


        while(cur!=null){
            cur.line=line_number++;
            if(cur.dest!=null&&colorMap.containsKey(cur.dest.name))
                cur.dest.register=colorMap.get(cur.dest.name);
            if(cur.var1!=null&&colorMap.containsKey(cur.var1.name))
                cur.var1.register=colorMap.get(cur.var1.name);
            if(cur.var2!=null&&colorMap.containsKey(cur.var2.name))
                cur.var2.register=colorMap.get(cur.var2.name);

            if(cur.opCode==OpCode.call){
                saveRegister.put(cur.line, new HashSet<>());
                for(Variable var : in.get(cur.line)){
                    if(colorMap.containsKey(var.name))
                        saveRegister.get(cur.line).add(colorMap.get(var.name));
                }
                for(Variable var : def.get(cur.line)){
                    if(colorMap.containsKey(var.name))
                        saveRegister.get(cur.line).add(colorMap.get(var.name));
                }
                for(Variable var : out.get(cur.line)){
                    if(colorMap.containsKey(var.name))
                        saveRegister.get(cur.line).add(colorMap.get(var.name));
                }
            }
            cur=cur.next;
        }
        System.err.println("----------------------------------------------");
        tmp.print();
        System.err.println("----------------------------------------------");

        return tmp;
    }
}

class CA {
  int[]cells;
  int[]ruleset={0,1,0,1,1,0,1,0};//strat with rule 90
  
  int generation=0;
  int w=5;
  
  CA(){
    cells=new int[width/w];    
    for(int i=0; i<cells.length; i++){
      cells[i]=0;
    }
    cells[cells.length/2]=1;
  }
  
  void restart(){
    for(int i=0; i<cells.length; i++){
      cells[i]=0;
    }
    cells[cells.length/2]=1;
    
    generation=0;
    
    for(int i=0; i<ruleset.length; i++){
      ruleset[i]=int(random(2));
    }
    
  }
  void generate(){
    int[] nextgen=new int[cells.length];
    for(int i=1;i<cells.length-1; i++){
      int left= cells[i-1];
      int me=cells[i];
      int right=cells[i+1];
      nextgen[i]=rules(left,me,right);
    }
    cells=nextgen;
    generation++;
  }
  
  void display(){
    for(int i=0;i<cells.length; i++){
      if (cells[i]==1) fill(0);
      else fill(255);
      rect(i*w,generation*w,w,w);
    }
  }
  
  int rules(int a, int b, int c){
    String s=""+a+b+c;
    int index=Integer.parseInt(s,2);
    return ruleset[index];
  }
}
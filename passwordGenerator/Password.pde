class Password{
  
  String word="";
  int n;
  Password(){
    word="Hello!";
    n=48;
  }
  
  void generate(){
    word="";
    for(int i=0; i<10;i++){
      float a=random(1);
      if(a>.8){
        int n=int(random(48,57));
        word+=char(n);
      }else if(a>0.4){
        int n=int(random(65,90));
        word+=char(n);
      }else{
        int n=int(random(97,122));
        word+=char(n);
      }
      
    }//for loop
    
  }
  
  void display(){
    fill(200,100,0);
    rectMode(CENTER);
    rect(200,110,250,80);
    fill(0);
    textAlign(CENTER);
    textSize(24);
    text(word, 200,115);
  }
}
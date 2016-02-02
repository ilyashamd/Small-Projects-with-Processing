class Botton{
  color c;
  
  Botton(){
    c=color(200,100,123);
    
  }
  
  void display(){
    fill(c);
    rectMode(CENTER);
    rect(200,200,100,40);
    fill(0);
    textAlign(CENTER);
    textSize(16);
    text("generate", 200,205);
  }
  
  boolean isClicked(){
    c=100;
    return true;
  }
}
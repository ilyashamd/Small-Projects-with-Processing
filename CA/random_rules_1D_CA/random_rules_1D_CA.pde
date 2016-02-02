CA ca;
void setup(){
  size(1000,600);
  ca=new CA();
  
  background(255);
}

void draw(){
  //println(ca.generation);
  
  ca.display();
  ca.generate();
  if(ca.generation*ca.w>height-ca.w){
    background(255);
    ca.restart();
  }
}

void mousePressed(){
  background(255);
  ca.restart();
}
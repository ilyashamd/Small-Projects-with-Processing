CA ca;
void setup(){
  size(1000,600);
  ca=new CA();
  
  background(255);
}

void draw(){
  ca.display();
  ca.generate();
  println(ca.generation);
  if(ca.generation*ca.w>height-ca.w) {
    saveFrame("rule90.png");
    noLoop();
  }
}
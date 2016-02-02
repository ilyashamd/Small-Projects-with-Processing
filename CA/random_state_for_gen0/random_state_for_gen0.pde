CA ca;
PImage img;

void setup(){
  size(1000,600);
  ca=new CA();
  
  img=createImage(width,height,RGB);
  
  background(255);
}

void draw(){
  //println(ca.generation);
  
  ca.display();
  ca.generate();
  if(ca.generation*ca.w>height-ca.w){
    saveFrame("ca.jpeg");
    background(255);
    ca.restart();
  }
}

void mousePressed(){
  background(255);
  ca.restart();
}
Botton b;
Password p;

void setup(){
  size(400,300);
  p=new Password();
  b=new Botton();
}

void draw(){
  b.display();
  p.display();
}

void mousePressed(){
  if(b.isClicked()){
    p.generate();
  }
}
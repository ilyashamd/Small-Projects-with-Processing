Pendulum p;

void setup() {
  size(640,360);
  p=new Pendulum();
}


void draw (){
  background(255);
  p.update();
  p.display();
}

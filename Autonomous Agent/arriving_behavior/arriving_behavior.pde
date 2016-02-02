Vehicle v;
PVector mouse;

void setup(){
  size(600,350);
  v=new Vehicle(width/2,height/2);
  mouse=new PVector();
}

void draw(){
  background(255);
  mouse.x=mouseX;
  mouse.y=mouseY;
  v.seek(mouse);
  v.update();
  v.display();
}
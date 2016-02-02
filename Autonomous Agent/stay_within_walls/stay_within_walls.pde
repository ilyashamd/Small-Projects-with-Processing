Vehicle v;
float d;

void setup(){
  size(600,450);
  v=new Vehicle(width/2,height/2);
  
  d=35;
}

void draw(){
  background(255);
  
  noFill();
  stroke(155,115);
  rectMode(CENTER);
  rect(width/2, height/2, width-2*d,height-2*d);

  v.boundaries(d);
  v.update();
  v.display();
}
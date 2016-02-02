PImage me;

void setup(){
  size(600,400);
  me=loadImage("IMG_0355.JPG");
  me.filter(THRESHOLD, 0.55);//change the THRESHOLD value
  
}

void draw(){
  pushMatrix();
  tint(255,200,0);
  image(me,0,0,300,200);
  popMatrix();
  
  pushMatrix();
  translate(300,0);
  tint(50,120,200);
  image(me,0,0,300,200);
  popMatrix();
  
  pushMatrix();
  translate(0,200);
  tint(255,20,0);
  image(me,0,0,300,200);

  popMatrix();
  
  pushMatrix();
  translate(300,200);
    tint(20,255,100);
  image(me,0,0,300,200);
  popMatrix();
}
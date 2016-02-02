import ddf.minim.*;

Minim minim;
AudioInput mic;
int x=1;

void setup(){
  size(400,300);
  
  minim=new Minim(this);
  mic=minim.getLineIn();
  
  frameRate(200);
  
}

void draw(){
  stroke(#2FC12D);
  line(x, (height-20), x,(height-20)-abs(mic.left.get(0)*200));
  x=x+1;
  
  if(x>=width){
    background(200);
    x=0;
  } 
  
}
import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;


Box2DProcessing box2d;
Surface sf;
ArrayList<Box> boxes;

void setup(){
  size(640,360);
  smooth();
  
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  sf=new Surface();  
  boxes=new ArrayList<Box>();
  
}

void draw(){
  background(255);
  box2d.step();
  
  sf.display();
  
  if (mousePressed) {
    Box p=new Box(mouseX,mouseY);
    boxes.add(p);
  }
  
  for (Box p: boxes){
    p.display();
  }
}
  
  
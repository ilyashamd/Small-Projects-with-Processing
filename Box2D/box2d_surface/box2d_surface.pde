import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;


Box2DProcessing box2d;
Surface sf;

void setup(){
  size(640,360);
  smooth();
  
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  sf=new Surface();
  
}

void draw(){
  background(255);
  box2d.step();
  
  sf.display();
}
  
  
//Comples forms:
//Building a simgle body with more shapes

import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;


Box2DProcessing box2d;
ArrayList<Shape> shapes;
Surface sf;

void setup(){
  size(460,400);
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  shapes=new ArrayList<Shape>();
  sf=new Surface();
  
}

void draw(){
  background(255);
  box2d.step();
  sf.display();
  
  if (mousePressed) {
    Shape p=new Shape(mouseX,mouseY);
    shapes.add(p);
  }
  
  for (Shape p: shapes){
    p.display();
  }
  
}
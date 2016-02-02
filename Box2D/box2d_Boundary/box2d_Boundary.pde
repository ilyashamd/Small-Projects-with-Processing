import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList boundaries;

void setup() {
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boundaries = new ArrayList();
  boundaries.add(new Boundary(width/2,height-5,width,10,0));
  boundaries.add(new Boundary(width/2,5,width,10,0));
  boundaries.add(new Boundary(width-5,height/2,10,height,0));
  boundaries.add(new Boundary(5,height/2,10,height,0));
}

void draw() {
  background(255);
  box2d.step();
  for (int i = 0; i < boundaries.size(); i++) {
    Boundary wall = (Boundary) boundaries.get(i);
    wall.display();
  }
}
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList boundaries;
ArrayList<Particle> particles;
float r;

void setup() {
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  
  particles=new ArrayList<Particle>();
  
  
  boundaries = new ArrayList();
  boundaries.add(new Boundary(width/2,height-5,width,10,0));
  //boundaries.add(new Boundary(width/2,5,width,10,0));
  //boundaries.add(new Boundary(width-5,height/2,10,height,0));
  //boundaries.add(new Boundary(5,height/2,10,height,0));
}

void draw() {
  background(255);
  box2d.step();
  for (int i = 0; i < boundaries.size(); i++) {
    Boundary wall = (Boundary) boundaries.get(i);
    wall.display();
  }
  

  for (Particle p: particles){
    p.display();
  }
  
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    if (p.done()) {
      particles.remove(i);
    }
  }
}

void mousePressed() {
    r=random(4,16);
    Particle p=new Particle(mouseX,mouseY, r);
    particles.add(p);
}

void beginContact(Contact cp){
  Fixture f1=cp.getFixtureA();
  Fixture f2=cp.getFixtureB();
  
  Body b1=f1.getBody();
  Body b2=f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();  
  if (o1.getClass() == Particle.class && o2.getClass() == Particle.class) {
    Particle p1 = (Particle) o1;
    p1.change();
    Particle p2 = (Particle) o2;
    p2.change();
  }
}
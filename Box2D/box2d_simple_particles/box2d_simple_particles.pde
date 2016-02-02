import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;


Box2DProcessing box2d;
ArrayList<Particle> particles;
float r;

void setup(){
  size(360,400);
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  particles=new ArrayList<Particle>();
  
  r=10;
}

void draw(){
  background(255);
  box2d.step();
  
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

void   mousePressed() {
    Particle p=new Particle(mouseX,mouseY, r);
    particles.add(p);
  }
import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;


Box2DProcessing box2d;
ArrayList<Particle> particles;
Windmill mill;

void setup(){
  size(360,400);
  box2d= new Box2DProcessing(this);
  box2d.createWorld();
  mill=new Windmill(width/2, height/2);
  particles=new ArrayList<Particle>();
  
}

void draw(){
  background(255);
  box2d.step();
  mill.display();
  
  if (random(1) < 0.1) {
    float sz = random(4,8);
    particles.add(new Particle(random(width/2-100,width/2+100),-20,sz));
  }
  
  for (Particle p: particles){
    p.display();
  }
  text("Click mouse to toggle motor",10,height-30);
}
void mousePressed() {
  mill.toogleMotor();
}
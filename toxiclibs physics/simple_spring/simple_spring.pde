import toxi.geom.*;
import toxi.physics2d.*;

VerletPhysics2D physics;
Particle p1;
Particle p2;
float len,strength;

void setup(){
  size(360,400);
  len=100;
  strength=0.01;
  
  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  physics.setGravity(new Vec2D(0,0.1));
  
  p1=new Particle(new Vec2D(width/2,20));
  p2=new Particle(new Vec2D(width/2,30));
  p1.lock();//locking Particle 1 in place
  
  //creating one Spring
  VerletSpring2D spring=new VerletSpring2D(p1,p2,len,strength);
  
  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addSpring(spring);
}

void draw(){
  physics.update();
  background(255);
  
  line(p1.x,p1.y, p2.x, p2.y);
  p1.display();
  p2.display();
}

void mousePressed(){
  p2.lock();
  p2.x=mouseX;
  p2.y=mouseY;
  p2.unlock();
}
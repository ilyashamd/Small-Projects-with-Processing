import toxi.geom.*;
import toxi.physics2d.*;

VerletPhysics2D physics;
ArrayList<Particle> particles;
float len,strength;
int numPoints;

void setup(){
  size(360,400);
  len=10;
  strength=0.01;
  numPoints=15;
  
  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  physics.setGravity(new Vec2D(0,0.1));
  
  particles=new ArrayList<Particle>();
  for(int i=0; i<numPoints;i++){
    Particle particle=new Particle(width/2+i*len,2);
    physics.addParticle(particle);
    particles.add(particle);
    
    if(i !=0){
      Particle previous=particles.get(i-1);
      VerletSpring2D spring=new VerletSpring2D(particle,previous,len,strength);
      physics.addSpring(spring);
    }
  }
  
    
  Particle head=particles.get(0);
  
  head.lock();
}

void draw(){
  physics.update();
  background(255);
  
  stroke(0);
  noFill();
  beginShape();
  for(Particle p : particles){
    vertex(p.x,p.y);
  }
  endShape();
  Particle tail=particles.get(numPoints-1);
  tail.display();
}

void mouseDragged(){
  Particle tail=particles.get(numPoints-1);
  tail.lock();
  tail.x=mouseX;
  tail.y=mouseY;
  tail.display();
  tail.unlock();
}
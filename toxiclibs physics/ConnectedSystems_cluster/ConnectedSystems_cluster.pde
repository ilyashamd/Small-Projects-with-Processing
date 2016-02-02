import toxi.geom.*;
import toxi.physics2d.*;

VerletPhysics2D physics;
Cluster cluster;

void setup(){
  size(360,400);
  
  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  cluster=new Cluster(8,100,new Vec2D(width/2, height/2));
}

void draw(){
  physics.update();
  background(255);
  
  cluster.display();
  text("clik mouse to change the cluster", 20, height-20);
}

void mousePressed(){
  cluster=new Cluster(int(random(4,12)),100,new Vec2D(width/2, height/2));
}
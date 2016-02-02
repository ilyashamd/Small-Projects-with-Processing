import toxi.geom.*;
import toxi.physics2d.*;

VerletPhysics2D physics;

void setup(){
  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0,0,width,height));
  physics.setGravity(new Vec2D(0,0.1));
}

void draw(){
  physics.update();
}
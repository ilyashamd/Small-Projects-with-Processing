class Pair{
  Particle p1,p2;
  float len=32;
  
  Pair(float x, float y){
    
    p1=new Particle(x,y);
    p2=new Particle(x+random(-1,1), y+random(-1,1));
    
    DistanceJointDef djd=new DistanceJointDef();
    djd.bodyA=p1.body;
    djd.bodyB=p2.body;
    djd.length=box2d.scalarPixelsToWorld(len);
    djd.frequencyHz=3;
    djd.dampingRatio=0.1;
    
    DistanceJoint dj=(DistanceJoint) box2d.world.createJoint(djd);
  }
  
  void display() {
    Vec2 pos1= box2d.getBodyPixelCoord(p1.body);
    Vec2 pos2= box2d.getBodyPixelCoord(p2.body);
    stroke(0);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
    p1.display();
    p2.display();
  }
}//end class
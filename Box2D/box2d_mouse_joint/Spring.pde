class Spring{
  
  MouseJoint mouseJoint;
  
  Spring(){
    mouseJoint = null;
  }
  
  
  void update(float x,float y){
    if (mouseJoint != null) {
      Vec2 mouseWorld=box2d.coordPixelsToWorld(x,y);
      mouseJoint.setTarget(mouseWorld);
    }
  }
  
  void destroy(){
    if (mouseJoint != null) {
      box2d.world.destroyJoint(mouseJoint);
      mouseJoint = null;
    }
  }
  
  void display() {
    if (mouseJoint != null) {
      // We can get the two anchor points
      Vec2 v1 = new Vec2(0,0);
      mouseJoint.getAnchorA(v1);
      Vec2 v2 = new Vec2(0,0);
      mouseJoint.getAnchorB(v2);
      // Convert them to screen coordinates
      v1 = box2d.coordWorldToPixels(v1);
      v2 = box2d.coordWorldToPixels(v2);
      // And just draw a line
      stroke(0);
      strokeWeight(1);
      line(v1.x,v1.y,v2.x,v2.y);
    }
  }
  
  void bind(float x,float y,Box box) {
    
    MouseJointDef md=new MouseJointDef();
    md.bodyA=box2d.getGroundBody();
    md.bodyB=box.body;
    
    //setting target
    Vec2 mp = box2d.coordPixelsToWorld(x,y);
    md.target.set(mp);
    
    md.maxForce=5000.0* box.body.m_mass;
    md.frequencyHz=5;
    md.dampingRatio=0.9;
    
    mouseJoint=(MouseJoint) box2d.world.createJoint(md);
  }
}//end class
class Car {
  
  RevoluteJoint joint,joint2;
  Box box;
  Particle p1,p2;
  
  Car(float x, float y) {
    
    box=new Box(x,y,120,40,false);
    p1=new Particle(x-40,y+20);
    p2=new Particle(x+40,y+20);
    
    RevoluteJointDef rjd = new RevoluteJointDef();
    RevoluteJointDef rjd2 = new RevoluteJointDef();
    
    rjd.initialize(box.body,p1.body,p1.body.getWorldCenter());
    rjd2.initialize(box.body,p2.body,p2.body.getWorldCenter());
    
    rjd.motorSpeed=-PI*2;
    rjd.maxMotorTorque=300.0;
    rjd.enableMotor=true;
    rjd2.motorSpeed=-PI*2;
    rjd2.maxMotorTorque=300.0;
    rjd2.enableMotor=true;
    
    joint=(RevoluteJoint) box2d.world.createJoint(rjd);
    joint2=(RevoluteJoint) box2d.world.createJoint(rjd2);
  }
  
  void display(){
    p1.display();
    p2.display();
    box.display();
    
    Vec2 anchor = box2d.coordWorldToPixels(p1.body.getWorldCenter());
    Vec2 anchor2 = box2d.coordWorldToPixels(p2.body.getWorldCenter());
    fill(0);
    noStroke();
    ellipse(anchor.x, anchor.y, 8, 8);
    ellipse(anchor2.x, anchor2.y, 8, 8);
   
  }
  
  void toogleMotor() {
    boolean motorstatus=joint.isMotorEnabled();
    joint.enableMotor(!motorstatus);
   }
}//end class
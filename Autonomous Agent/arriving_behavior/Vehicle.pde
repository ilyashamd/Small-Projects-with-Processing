class Vehicle{
  PVector location, velocity, acceleration;
  float maxforce, maxspeed;
  
  Vehicle(float x, float y){
    location=new PVector(x,y);
    velocity=new PVector(random(-2,2),random(-2,2));
    acceleration=new PVector();
    
    maxforce=0.1;
    maxspeed=4;
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void seek(PVector target){
    PVector desired=PVector.sub(target,location);
    desired.mult(0.05);//5% of the distance
    PVector steer=PVector.sub(desired,velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }
    
  
  void display(){
    float r=16;
    float angle=velocity.heading();
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(0,0,r*2,r*2);
    // Let's add a line so we can see the rotation
    line(0,0,r,0);
    popMatrix();
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
}
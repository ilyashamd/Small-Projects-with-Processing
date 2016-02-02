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
  
  void follow(FlowField flow){
    PVector desired=flow.lookup(location);
    desired.mult(maxspeed);
    PVector steer=PVector.sub(desired,velocity);
      steer.limit(maxforce);
      applyForce(steer);
    
  }
    
  
  void display(){
    float r=6;
    float angle=velocity.heading();
    
    if (location.x > width)   location.x=0;
    if (location.x < 0)       location.x=width;
    if (location.y > height)  location.y=0;
    if (location.y < 0)       location.y=height;
    
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
    velocity.limit(maxspeed);
    location.add(velocity);
    
    acceleration.mult(0);
  }
}
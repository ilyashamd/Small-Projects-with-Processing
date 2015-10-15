class Pendulum {
  
  PVector loc; //location of bob
  PVector origin; // location of arm origin
  float angle,r,aVelocity,aAcceleration;
  
  Pendulum() {
    
    origin= new PVector(width/2, 0);
    loc=new PVector();
    
    angle=PI/4;
    r=200;
  }
  
  void update() {
    float gravity = 0.4;
    aAcceleration=(-1*gravity/r)*sin(angle);
    aVelocity += aAcceleration;                 // Increment velocity
    angle += aVelocity; 
  }
  
  void display(){
    loc.set(r*sin(angle), r*cos(angle));         // Polar to cartesian conversion
    loc.add(origin);                              // Make sure the location is relative to the pendulum's origin

    stroke(0);
    strokeWeight(2);
    // Draw the arm
    line(origin.x, origin.y, loc.x, loc.y);
    ellipseMode(CENTER);
    fill(175);
    // Draw the ball
    ellipse(loc.x, loc.y, 40, 40);
    
  }
  
}

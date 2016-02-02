class Particle extends VerletParticle2D{
  
  
  Particle(Vec2D loc) {
    super(loc);
  }
  
  void display(){
    fill(175);
    stroke(0);
    ellipse(x,y,26,26);
  }
  
}//end class
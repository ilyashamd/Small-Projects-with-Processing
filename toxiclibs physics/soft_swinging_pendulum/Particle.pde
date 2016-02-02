class Particle extends VerletParticle2D{
  
  
  Particle(float x, float y) {
    super(x,y);
  }
  
  void display(){
    fill(175);
    stroke(0);
    ellipse(x,y,26,26);
  }
  
}//end class
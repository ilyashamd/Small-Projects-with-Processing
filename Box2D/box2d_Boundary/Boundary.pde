class Boundary{
  float x;
  float y;
  float w;
  float h;
   
  Body b;
  
  Boundary(float x_,float y_, float w_, float h_, float a) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);


    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.angle = a;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    b.createFixture(sd,1);
  }

  
  void display() {
    noFill();
    stroke(127);
    fill(127);
    strokeWeight(1);
    rectMode(CENTER);

    float a = b.getAngle();

    pushMatrix();
    translate(x,y);
    rotate(-a);
    rect(0,0,w,h);
    popMatrix();
  }

}
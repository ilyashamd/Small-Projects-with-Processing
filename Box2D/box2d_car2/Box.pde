class Box {
  
  Body body;
  float x,y;
  float w,h;
  
  Box(float _x, float _y, float _w,float _h, boolean s) {
    x=_x; y=_y; w=_w; h=_h;
    
    BodyDef bd=new BodyDef();
    if (s) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body=box2d.createBody(bd);
    
    PolygonShape ps=new PolygonShape();
    float box2dW=box2d.scalarPixelsToWorld(w/2);
    float box2dH=box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd=new FixtureDef();
    fd.shape=ps;
    
    fd.density=1;
    fd.friction=0.3;
    fd.restitution=0.5;
    
    body.createFixture(fd);    
  }
  
  
  void display() {
    Vec2 pos= box2d.getBodyPixelCoord(body);
    float a=body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175,100,100);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
  void killBody(){
  box2d.destroyBody(body);
  }
  
}
class Shape {
  
  Body body;
  float x,y;
  float w,h;
  float r;
  
  Shape(float _x, float _y) {
    x=_x; y=_y;
    w=10; h=25; r=10;
    BodyDef bd=new BodyDef();
    bd.type=BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body=box2d.createBody(bd);
    
    PolygonShape ps=new PolygonShape();
    float box2dW=box2d.scalarPixelsToWorld(w/2);
    float box2dH=box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    CircleShape cs=new CircleShape();
    cs.m_radius=box2d.scalarPixelsToWorld(r);
    Vec2 offset =new Vec2(0,-h/2);
    offset=box2d.vectorPixelsToWorld(offset);
    cs.m_p.set(offset.x,offset.y);
    
    body.createFixture(ps,1);
    body.createFixture(cs,1);
  }
  
  
  void display() {
    Vec2 pos= box2d.getBodyPixelCoord(body);
    float a=body.getAngle();
       
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rect(0,0,w,h);
    ellipse(0,-h/2,r*2,r*2);
    popMatrix();
  }
  
  
}
class Shape {
  
  Body body;
  float x,y;
    
  Shape(float _x, float _y) {
    x=_x; y=_y;
   
    BodyDef bd=new BodyDef();
    bd.type=BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body=box2d.createBody(bd);
    
    PolygonShape ps=new PolygonShape();
    Vec2[]vertices=new Vec2[4];
    vertices[0]=box2d.vectorPixelsToWorld(new Vec2(-15,25));
    vertices[1]=box2d.vectorPixelsToWorld(new Vec2(10,5));
    vertices[2]=box2d.vectorPixelsToWorld(new Vec2(20,-15));
    vertices[3]=box2d.vectorPixelsToWorld(new Vec2(-10,-10));
    ps.set(vertices,vertices.length);
    
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
    
    Fixture f= body.getFixtureList();
    PolygonShape ps=(PolygonShape) f.getShape();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    beginShape();
    for (int i=0; i<ps.getVertexCount(); i++){
      Vec2 V= box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(V.x,V.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void killBody(){
  box2d.destroyBody(body);
  }
  
}
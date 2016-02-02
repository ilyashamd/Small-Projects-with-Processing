// ChainShape with three hard-coded vertices
class Surface {
  
  Body body;
  ArrayList <Vec2> surface;
  
  Surface() {
    surface= new ArrayList <Vec2>();
    surface.add(new Vec2(20,height/2+70));
    surface.add(new Vec2(width-20, height/2+70));
    surface.add(new Vec2(width-20, height-100));
    surface.add(new Vec2(20,height-100));
    
    ChainShape chain=new ChainShape();
    Vec2[] vertices=new Vec2[surface.size()];
    
    for(int i=0; i<vertices.length; i++){
      vertices[i]=box2d.coordPixelsToWorld(surface.get(i));
    }
    
    chain.createChain(vertices,vertices.length);
    
    BodyDef bd=new BodyDef();
    body=box2d.createBody(bd);
    body.createFixture(chain,1);    
  }
  
  
  void display() {
    //strokeWeight(1);
    stroke(0);
    fill(155);
    beginShape();
    for(Vec2 v:surface){
      vertex(v.x, v.y);
    }
    
    endShape(CLOSE);
  }
  
}
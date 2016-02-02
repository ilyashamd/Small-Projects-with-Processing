class FlowField{
  
  PVector [][] field;
  
  int cols,rows;
  int resolution;
  
  FlowField(int r){
    
    resolution=r;
    cols=width/resolution;
    rows=height/resolution;
    
    field=new PVector[cols][rows];
    init();    
  }
  
  void init(){
    // Reseed noise so we get a new flow field every time
    noiseSeed((int)random(10000));
    float xoff=0;
    for(int i=0;i<cols;i++){
      float yoff=0;
      for(int j=0;j<rows;j++){
        float theta=map(noise(xoff,yoff),0,1,0,TWO_PI);
        field[i][j]=new PVector(cos(theta),sin(theta));
        yoff+=.11;
      }
      xoff+=.1;
    }
  }
  
  PVector lookup(PVector lookup){
    int coloumn=int(constrain(lookup.x/resolution,0,cols-1));
    int row=int(constrain(lookup.y/resolution,0,rows-1));
    
    return field[coloumn][row].get();
  }
  
  void display(){
    for(int i=0;i<cols;i++){
      for(int j=0;j<rows;j++){
                drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }
  }
  
  void drawVector(PVector v, float x, float y, float s){
    pushMatrix();
    float arrowsize = 4;
    translate(x,y);
    stroke(0,100);
    float a=v.heading();
    rotate(a);
    float len = v.mag()*s;
    line(0,0,len,0);
    popMatrix();
  }
    
  
}
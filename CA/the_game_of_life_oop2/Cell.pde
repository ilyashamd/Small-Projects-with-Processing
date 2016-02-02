class Cell{
  float x,y;
  int w;
  int state;
  int previous;
  Cell(float _x, float _y) {
    x=_x;
    y=_y;
  }
  void display(int _w) {
    w=_w;
    if(previous==0 &&state==1) fill(100,0,255);
    else if(state==1) fill(0);
    else if(previous==1 &&state==0) fill(255,0,0);
    else fill(255);
    
    rect(x,y,w,w);
}
}
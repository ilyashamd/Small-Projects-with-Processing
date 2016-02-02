//edges remain constant

GOL gol;
int w=6;
void setup() {
  size(640,360);
  frameRate(24);
  
  gol=new GOL(w);
}

void draw() {
  gol.display();
  gol.generate();
}


void mousePressed(){
  gol.init();
}
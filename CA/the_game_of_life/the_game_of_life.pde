
int columns,raws;
int w=8;
int[][]board;

void setup() {
  size(640,360);
  frameRate(24);
  
  columns=width/w;
  raws=height/w;
  board=new int[columns][raws];
  
  init();
}

void draw() {
  display();
  generate();
}

void init() {
  
  for (int x=0; x<columns; x++) {
    for (int y=0; y<raws; y++) {
      board[x][y]=int(random(2));
    }
  }
}

void generate() {
  int[][]next=new int[columns][raws];
  
  for (int x=1; x<columns-1; x++) {
    for (int y=1; y<raws-1; y++) {

      int neighbors=0;
      for (int i=-1; i<=1; i++) {
        for (int j=-1; j<=1; j++) {
          neighbors+=board[x+i][y+j];
        }
      }
      neighbors-=board[x][y];

      if       ((board[x][y]==1)&&(neighbors<2))   next[x][y]=0;
      else if  ((board[x][y]==1)&&(neighbors>3))   next[x][y]=0;
      else if  ((board[x][y]==0)&&(neighbors==3))  next[x][y]=1;
      else                                         next[x][y] = board[x][y];
    }
  }
  board=next;
}

void display() {
  for (int x=0; x<columns; x++) {
    for (int y=0; y<raws; y++) {
      if (board[x][y]==1) fill(0);
      else fill(255);
      stroke(0);
      rect(x*w, y*w, w,w);
    }
  }
}

void mousePressed(){
  init();
}
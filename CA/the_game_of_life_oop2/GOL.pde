class GOL {


  int columns, raws;
  int w;
  Cell[][]board;

  GOL(int _w) {
    w=_w;

    columns=width/w;
    raws=height/w;
    board=new Cell[columns][raws];

    init();
  }


  void init() {

    for (int x=0; x<columns; x++) {
      for (int y=0; y<raws; y++) {
        board[x][y]=new Cell(x*w,y*w);
        board[x][y].state=int(random(2));
      }
    }
  }

  void generate() {
    for (int x=0; x<columns; x++) {
      for (int y=0; y<raws; y++) {
        board[x][y].previous=board[x][y].state;
      }
    }

    for (int x=0; x<columns; x++) {
      for (int y=0; y<raws; y++) {

        int neighbors=0;
        for (int i=-1; i<=1; i++) {
          for (int j=-1; j<=1; j++) {
            neighbors+=board[(x+i+columns)%columns][(y+j+raws)%raws].previous;
          }
        }
        neighbors-=board[x][y].previous;

        if       ((board[x][y].previous==1)&&(neighbors<2))   board[x][y].state=0;
        else if  ((board[x][y].previous==1)&&(neighbors>3))   board[x][y].state=0;
        else if  ((board[x][y].previous==0)&&(neighbors==3))  board[x][y].state=1;
        else                              board[x][y].state = board[x][y].previous;
      }
    }
  }

  void display() {
    for (int x=0; x<columns; x++) {
      for (int y=0; y<raws; y++) {
        board[x][y].display(w);
      }
    }
  }
  
}
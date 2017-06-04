//Copyright Jason Wang
//The Knights tour

PFont font;

int boxNum = 8;
int boxSize;
Board[][] board;
int boxValue[][];
int arrow[][];
int arrowCount;

void setup() {
  font = loadFont("SansSerif-48.vlw");
  textAlign(CENTER, CENTER);
  textFont(font,20);
  size(400,400);
  
  boxSize = width/boxNum;
  board = new Board[boxNum][boxNum];
  boxValue = new int [boxSize][boxSize];
  arrow = new int [int(sq(boxNum))][4];
  
  for(int x = 0; x < boxNum; x++) {
    for(int y = 0; y < boxNum; y++) {
      board[x][y] = new Board(x,y);
    }
  }
}

void draw() {
  for(int x = 0; x < boxNum; x++) {
    for(int y = 0; y < boxNum; y++) {
      board[x][y].display();
      if(boxValue[x][y] != 0) {
        board[x][y].numberPrint();
      }
    }
  }
  for(int i = 0; i < (sq(boxNum)); i++) {
    arrowDraw(arrow[i][0], arrow[i][1],
              arrow[i][2], arrow[i][3]);
  }
}

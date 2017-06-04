class Board {
  int x, y, xloc, yloc;
  int movableSpace;
  
  Board(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    xloc = x*width/boxNum;
    yloc = y*height/boxNum;
  }
  
  void display() {
    noStroke();
    if((x+y) % 2 != 0) {
      fill(#DBC59D);
    } else {
      fill(#C9860A);
    }
    rect(xloc, yloc, xloc+width/boxNum, yloc + height/boxNum);
  }
  
  void numberPrint() {
    fill(100);
    text(boxValue[x][y], xloc+boxSize/2, yloc+boxSize/2);
  }
  
  int moveCalculate(int xloc, int yloc) {
    int moveSpace[] = new int [8];
    boxValue[x][y] = 0;
    for(int i = - 2; i <=2; i++) {
      for(int j = -2; j <= 2; j++) {
        if((abs(i+j) == 3 || abs(i+j) == 1) && i != 0 && j != 0) {
          if((xloc + i >= 0 && xloc + i < boxNum) &&
             (yloc + j >= 0 && yloc + j < boxNum)) {
            boxValue[x][y]++;
          }
        }
      }
    }
    return boxValue[x][y];
  }
}

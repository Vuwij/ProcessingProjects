int currentX, currentY;
boolean End;

void mouseClicked() {
  currentX = mouseX / (width/boxNum);
  currentY = mouseY / (height/boxNum);
  
  calculate(currentX, currentY);
}

void calculate(int currentX, int currentY) {
  delay(1);
  locator(currentX, currentY);
  
  int min = 10;
  int pointer = 0;
  int tempmin;
  
  for(int i = 0; i < listnum; i++) {
    //println(board[findx[i]][findy[i]].moveCalculate(findx[i], findy[i]));
    tempmin = board[findx[i]][findy[i]].moveCalculate(findx[i], findy[i]);
    println(findx[i], findy[i]);
    if(tempmin < min) {
      min = tempmin;
      pointer = i;
    }
  }
  
  for(int i = 0; i < listnum; i++) {
    if(i != pointer) {
      boxValue[findx[i]][findy[i]] = 0;
    }
  }
  
  if(!End) {
    arrowInitialize(currentX, currentY, findx[pointer], findy[pointer]);
  }
  
  listnum = 0;
  println("-----");
  currentX = findx[pointer];
  currentY = findy[pointer];
  println(currentX, currentY);
  println("-----");
  
  while(!End) {
    calculate(currentX, currentY);
  }
}

int findx[] = new int[boxNum];
int findy[] = new int[boxNum];
int listnum = 0;

void locator(int currentX, int currentY) {
  clearnumb();
  for(int i = - 2; i <=2; i++) {
    for(int j = -2; j <= 2; j++) {
      if((abs(i+j) == 3 || abs(i+j) == 1) && i != 0 && j != 0) {
        if((currentX + i >= 0 && currentX + i < boxNum) &&
           (currentY + j >= 0 && currentY + j < boxNum)) {
          if(boxValue[currentX + i][currentY + j] == 0) {
            findx[listnum] = currentX+i;
            findy[listnum] = currentY+j;
            listnum++;
          }
        }
      }
    }
  }
  if(listnum == 0) {
    End = true;
  }
}

void clearnumb() {
  for (int i = 0; i < boxNum; i++) {
    findx[i] = 0;
    findy[i] = 0;
  }
}

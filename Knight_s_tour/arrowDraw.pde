void arrowDraw(int startX, int startY, int endX, int endY) {
  
  pushMatrix();
  stroke(0);
  line((startX+0.5)*boxSize, (startY+0.5)*boxSize,
       (endX+0.5)*boxSize, (endY+0.5)*boxSize);
  popMatrix();
  
}

void arrowInitialize(int startX, int startY, int endX, int endY) {
  arrow[arrowCount][0] = startX;
  arrow[arrowCount][1] = startY;
  arrow[arrowCount][2] = endX;
  arrow[arrowCount][3] = endY;
  arrowCount++;
}

void delay(int time) {
  try {
    Thread.sleep(time);
  }
  catch(Exception e){}
}
  

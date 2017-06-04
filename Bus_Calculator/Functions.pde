//draws an arrow showing the direction of the line
void direction(float startX, float startY, float endX, float endY) {
  float centerX = (startX+endX)/2;
  float centerY = (startY+endY)/2;
  float angle = atan2(endY-startY,endX-startX);
  triangle(centerX+cos(angle)*5,centerY+sin(angle)*5,
           centerX+cos(angle+PI/2)*5,centerY+sin(angle+PI/2)*5,
           centerX+cos(angle-PI/2)*5,centerY+sin(angle-PI/2)*5);
}

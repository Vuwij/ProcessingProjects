// A bus stop
class Stop {
  float xloc, yloc;
  int id; //id equal the stop number
  Stop (float beforeXloc, float beforeYloc, int identity) {
    xloc = beforeXloc;
    yloc = beforeYloc;
    id = identity;
  }
  
  //displays the bus stop
  void display() {
    noStroke();
    fill(255);
    ellipse(xloc,yloc,pointsize,pointsize);
  }
  
  //makes a blue circle around the bus stop
  void lightup() {
    stroke(0,0,255);
    noFill();
    ellipse(xloc,yloc,pointsize+5,pointsize+5);
  }
  
  //writes the number of the bus stop
  void identify() {
    textSize(20);
    text(id,xloc+5,yloc+5);
  }
  
}

// draws and determines the location of the school
void school() {
  pushMatrix();
  fill(255,0,0);
  ellipse(schoolX,schoolY,pointsize,pointsize);
  //text("S",schoolX+5,schoolY+5);
  popMatrix();
}

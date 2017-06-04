void calculation() {
  int stopped = stopnum;
  float currentlength = 0;
  float disp = 0;
  
  //(not done) a combination of the all possible bus numbers, currently 1 bus
  while(busnum > 0) {
    find(disp, schoolX, schoolY, 0);
    busnum--; //does the find algorithm for a certain number of bus (currently one)
  }
}
    

float currentdist = 0; // the current amount of places stopped at

//The calculation sequence
//min = current distance so far
//currentX, currentY = stop location
//stop level = current number of places stopped at
void find(float disp, float currentX, float currentY, int stoplevel) {
  
  //for a n number of bus stops, calculates the distance of each possible route (school to stop t)
  for(int t = 0; t < stops.size()-stoplevel; t++) {
    
    if (stoplevel <= stops.size()) { //exit function, exits when there are no more bus stops left
      Stop busstop = stops.get(t);   //gets the values for stop number t
      busstop.lightup();
      line(currentX,currentY,busstop.xloc,busstop.yloc); //draws the line to that bus stop
      direction(currentX,currentY,busstop.xloc,busstop.yloc); //draws the arrows to that bus stop
    
      disp += dist(currentX,currentY,busstop.xloc,busstop.yloc); //disp calulates the current distance travelled so far
      
      find(disp,busstop.xloc,busstop.yloc,stoplevel+1); //loops the next values, with a higher stoplevel
    
      if (stoplevel == stops.size()-1) { //if all stops are completed, draws a line from stop to school
        
        disp += dist(currentX,currentY,schoolX,schoolY);
        stroke(0,255,0);
        line(currentX,currentY,schoolX,schoolY); //draws line to school
        direction(currentX,currentY,schoolX,schoolY); //draws arrows to school
      
        println(disp); //prints the displacement
        println("end");
        
        disp = 0; //resets disp
      }
    
    }

  }
}

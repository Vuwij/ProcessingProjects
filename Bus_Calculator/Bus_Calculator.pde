int stopnum = -1; //how much stops generated initially - 1
int schoolX = 200; // schoolX location
int schoolY = 200; // school Y location
int busnum = 1; //how much buses there are
int pointsize = 5;

ArrayList<Stop> stops;

void setup() {
  background(0);
  smooth();
  size(400,400);
  ellipseMode(CENTER);
  
  
  //A array list of bus stops is created with initally "stopnum" stops
  stops = new ArrayList<Stop>();
  for (int i = 0; i <= stopnum; i++) {
    stops.add(new Stop(random(0,width),random(0,height),i+1));
  }
}

void draw() {
  
  //draw the inital bus stops
  for (int i = 0; i <= stops.size()-1; i++) {
    Stop busstop = stops.get(i);
    busstop.display(); //displays the location of the buses
    busstop.identify(); //writes the number of the buses
  }
  
  school();
}

void mousePressed() {
  stops.add(new Stop(mouseX, mouseY,stops.size()+1)); // adds a bus stop
}

void keyPressed() {
  if (key == 'd') {
    calculation(); //calculates the shortest route
  }
}

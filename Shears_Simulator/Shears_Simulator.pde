//GRAPHICS
PImage water, waterFloor;
PImage sky;
PImage stars;
PImage dock, dockEdge, dockEnd;

//OBJECTS
PShape boat;
PShape Lshear;
PShape Rshear;

//BOAT INFO
PVector position, velocity, acceleration;
float angle;

//SETTINGS
int cameraMode = 0;

void setup() {
  size(1000,600,P3D);
  noStroke();
  
  //TEXTURES
  water = loadImage("Water.png");
  waterFloor = loadImage("Ocean Floor.png");
  sky = loadImage("Sky.png");
  stars = loadImage("Stars.jpg");
  dock = loadImage("Dock1.png");
  dockEdge = loadImage("Dock Edge.png");
  dockEnd = loadImage("Dock End.png");
  initializeSphere(30,30);
  
  //OBJ FILES
  boat = loadShape("Boat.obj");
  Lshear = loadShape("Lshear.obj");
  Rshear = loadShape("Rshear.obj");
  
  //BOAT MOVEMENT
  position = new PVector(0,0);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
  angle = PI/2;
}

void draw() {
  background(68,67,70);
  
  //LIGHTS
  
  pointLight(235,235,255,0,-400,0);
  
  //CAMERA
  
  float rotateratio = float((mouseX-width/2))/width;
  println(rotateratio);
  
  if(cameraMode == 0)
    camera(mouseX-width/2, -200+mouseY-height/2, 200+(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, 1, 0);
  else if (cameraMode == 1)
    camera(position.x, -100, -position.y, position.x -100*cos(angle-rotateratio*PI), -100+(mouseY-height/2)/2, -position.y+100*sin(angle-rotateratio*PI), 0, 1, 0);
  else if (cameraMode == 2)
    camera(position.x, -100, -position.y, position.x -100*cos(angle-rotateratio*PI+PI/2), -100+(mouseY-height/2)/2, -position.y+100*sin(angle-rotateratio*PI+PI/2), 0, 1, 0);
  else if (cameraMode == 3)
    camera(position.x, -100, -position.y, position.x -100*cos(angle-rotateratio*PI-PI/2), -100+(mouseY-height/2)/2, -position.y+100*sin(angle-rotateratio*PI-PI/2), 0, 1, 0);
  
  //FUNCTIONS
  
  pushMatrix();
  rotateX(PI/2);
  boat();
  shears();
  popMatrix();
  
  drawbackground();
}

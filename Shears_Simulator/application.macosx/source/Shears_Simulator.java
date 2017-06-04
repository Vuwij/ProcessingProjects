import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Shears_Simulator extends PApplet {

//GRAPHICS AND OBJECTS
PImage water, waterFloor;
PImage sky;
PImage stars;
PImage dock, dockEdge, dockEnd;
PShape boat;

//BOAT INFO
PVector position, velocity, acceleration;
float angle;

//SETTINGS
boolean cameraMode = false;

public void setup() {
  size(1000,600,P3D);
  noStroke();
  
  //TEXTURES
  water = loadImage("Water.png");
  waterFloor = loadImage("Ocean Floor.png");
  sky = loadImage("Sky.png");
  stars = loadImage("Stars.png");
  dock = loadImage("Dock1.png");
  dockEdge = loadImage("Dock Edge.png");
  dockEnd = loadImage("Dock End.png");
  initializeSphere(30,30);
  
  //OBJ FILES
  boat = loadShape("Boat.obj");
  
  //BOAT MOVEMENT
  position = new PVector(0,0);
  velocity = new PVector(0,0);
  acceleration = new PVector(0,0);
  angle = PI/2;
}

public void draw() {
  background(68,67,70);
  
  //LIGHTS
  
  pointLight(235,235,255,0,-400,0);
  
  //CAMERA
  
  float rotateratio = PApplet.parseFloat((mouseX-width/2))/width;
  println(rotateratio);
  
  if(!cameraMode)
    camera(mouseX-width/2, -200+mouseY-height/2, 200+(height/2.0f) / tan(PI*30.0f / 180.0f), 0, 0, 0, 0, 1, 0);
  else {
    camera(position.x, -100, -position.y, position.x -100*cos(angle-rotateratio*PI), -100+(mouseY-height/2)/2, -position.y+100*sin(angle-rotateratio*PI), 0, 1, 0);
  }
  
  //FUNCTIONS
  drawbackground();
  boat();
  
}
public void boat() {
  
  if(velocity.mag() != 0 && abs(velocity.x) > 0.5f) {
    angle += acceleration.y/velocity.mag();
  } else if (abs(velocity.x) < 0.5f && abs(acceleration.y) > 0.05f) {
    if(acceleration.y > 0) {
      angle += 0.05f;
    } else {
      angle -= 0.05f;
    }
  }
  
  rotateX(PI/2);

  translate(position.x, 15, position.y);
  rotateY(-angle);
  stroke(255);
  line(0, -500, 0, 0, 500, 0);
  line(100, 10, 0, -100, 10, 0);
  stroke(255,0,0);
  line(0, 10, 100, 0, 10, -100);
  noStroke();

  shape(boat, 0, 0);
  position.x += velocity.x*cos(angle)+velocity.y*sin(angle);
  position.y += velocity.x*sin(angle)+velocity.y*cos(angle);

  velocity.add(acceleration);
  
  
  if(acceleration.x == 0) {
    if(velocity.x > 0) {
      velocity.x -= 0.1f;
    } else {
      velocity.x += 0.1f;
    }
  }
  if(acceleration.y == 0) {
    if(velocity.y > 0) {
      velocity.y -= 0.1f;
    } else {
      velocity.y += 0.1f;
    }
  }
}

public void keyPressed() {
  switch(key) {
    case ' ':
      if(cameraMode == false) cameraMode = true;
      else cameraMode = false;
      break;
    default:
      break;
  }
  switch(keyCode) { 
    case UP:
      acceleration.x = -0.2f;
      break;
    case DOWN:
      acceleration.x = 0.2f;
      break;
    case LEFT:
      acceleration.y = 0.1f;
      break;
    case RIGHT:
      acceleration.y = -0.1f;
      break;
  }
}

public void keyReleased() {
  switch(keyCode) {
    case UP:
      acceleration.x = 0;
      break;
    case DOWN:
      acceleration.x = 0;
      break;
    case LEFT:
      acceleration.y = 0;
      break;
    case RIGHT:
      acceleration.y = 0;
      break;
  }

}
public void drawbackground() {
  
  textureSphere(2000, 2000, 2000, stars);

  
  //SKY TEXTURES
  for(int i = 0; i < 4; i++) {
    rotateY(PI/2);
    beginShape();
      texture(sky);
      vertex(-2000, -600, 2000, 0, 0);
      vertex(2000, -600, 2000, sky.width, 0);
      vertex(2000, 0, 2000, sky.width, sky.height);
      vertex(-2000, 0, 2000, 0, sky.height);
    endShape();
  }
  
  //GUIDELINES
  rotateX(PI/2);
  int lineNumber = 5;
  for(int i = -1000; i < 1000; i = i + 100) {
    //stroke(255);
    line(i,-1000,i,1000);
    line(-1000,i,1000,i);
  }
  
  //WATER TEXTURES
  tint(255,191);
  for(int i = -20; i <= 20; i++) {
    for(int j = -20; j <= 20; j++) {
      beginShape();
        texture(water);
        vertex(-100*i, -100*j, 0, 0, 0);
        vertex(-100*i+100, -100*j, 0, water.width, 0);
        vertex(-100*i+100, -100*j+100, 0, water.width, water.height);
        vertex(-100*i, -100*j+100, 0, 0, water.height);
      endShape();
    }
  }
  noTint();
  
  //WATER FLOOR
  for(int i = -20; i <= 20; i++) {
    for(int j = -20; j <= 20; j++) {
      beginShape();
        texture(waterFloor);
        vertex(-100*i, -100*j, -100, 0, 0);
        vertex(-100*i+100, -100*j, -100, waterFloor.width, 0);
        vertex(-100*i+100, -100*j+100, -100, waterFloor.width, waterFloor.height);
        vertex(-100*i, -100*j+100, -100, 0, waterFloor.height);
      endShape();
    }
  }
  
  //DOCK SURFACE
  pushMatrix();
  translate(0,0,10);
  for(int j = 2; j < 10; j++) {
    beginShape();
      texture(dock);
      vertex(-75, j*100, 0, 0, 0);
      vertex(75, j*100, 0, dock.width, 0);
      vertex(75, j*100+100, 0, dock.width, dock.height);
      vertex(-75, j*100+100, 0, 0, dock.height);
    endShape();
    beginShape();
      texture(dock);
      vertex(-75, j*100, -11, 0, 0);
      vertex(75, j*100, -11, dock.width, 0);
      vertex(75, j*100+100, -11, dock.width, dock.height);
      vertex(-75, j*100+100, -11, 0, dock.height);
    endShape();
  }
  beginShape();
    texture(dock);
    vertex(-200, 100, 0, 0, 0);
    vertex(200, 100, 0, dock.width, 0);
    vertex(200, 200, 0, dock.width, dock.height);
    vertex(-200, 200, 0, 0, dock.height);
  endShape();
  popMatrix();
  
  //DOCK EDGE
  for(int j = 2; j < 10; j++) {
    beginShape();
      texture(dockEdge);
      vertex(-75, j*100, 0, 0, 0);
      vertex(-75, j*100, 10, dockEdge.width, 0);
      vertex(-75, j*100+100, 10, dockEdge.width, dockEdge.height);
      vertex(-75, j*100+100, 0, 0, dockEdge.height);
    endShape();
    beginShape();
      texture(dockEdge);
      vertex(75, j*100, 0, 0, 0);
      vertex(75, j*100, 10, dockEdge.width, 0);
      vertex(75, j*100+100, 10, dockEdge.width, dockEdge.height);
      vertex(75, j*100+100, 0, 0, dockEdge.height);
    endShape();
  }
  beginShape();
      texture(dockEdge);
      vertex(200, 100, 0, 0, 0);
      vertex(200, 100, 10, dockEdge.width, 0);
      vertex(200, 200, 10, dockEdge.width, dockEdge.height);
      vertex(200, 200, 0, 0, dockEdge.height);
    endShape();
  beginShape();
      texture(dockEdge);
      vertex(-200, 100, 0, 0, 0);
      vertex(-200, 100, 10, dockEdge.width, 0);
      vertex(-200, 200, 10, dockEdge.width, dockEdge.height);
      vertex(-200, 200, 0, 0, dockEdge.height);
    endShape();
    
  //DOCK END
  beginShape();
    texture(dockEnd);
    vertex(-200, 100, 0, 0, 0);
    vertex(200, 100, 0, dockEnd.width, 0);
    vertex(200, 100, 10, dockEnd.width, dockEnd.height);
    vertex(-200, 100, 10, 0, dockEnd.height);
  endShape();
  beginShape();
    texture(dockEnd);
    vertex(-200, 200, 0, 0, 0);
    vertex(200, 200, 0, dockEnd.width, 0);
    vertex(200, 200, 10, dockEnd.width, dockEnd.height);
    vertex(-200, 200, 10, 0, dockEnd.height);
  endShape();
  
  beginShape();
    texture(dockEnd);
    vertex(-75, 1000, 0, 0, 0);
    vertex(75, 1000, 0, dockEnd.width, 0);
    vertex(75, 1000, 10, dockEnd.width, dockEnd.height);
    vertex(-75, 1000, 10, 0, dockEnd.height);
  endShape();
  
}
int numPointsW;
int numPointsH_2pi; 
int numPointsH;

float[] coorX;
float[] coorY;
float[] coorZ;
float[] multXZ;

public void initializeSphere(int numPtsW, int numPtsH_2pi) {

  // The number of points around the width and height
  numPointsW=numPtsW+1;
  numPointsH_2pi=numPtsH_2pi;  // How many actual pts around the sphere (not just from top to bottom)
  numPointsH=ceil((float)numPointsH_2pi/2)+1;  // How many pts from top to bottom (abs(....) b/c of the possibility of an odd numPointsH_2pi)

  coorX=new float[numPointsW];   // All the x-coor in a horizontal circle radius 1
  coorY=new float[numPointsH];   // All the y-coor in a vertical circle radius 1
  coorZ=new float[numPointsW];   // All the z-coor in a horizontal circle radius 1
  multXZ=new float[numPointsH];  // The radius of each horizontal circle (that you will multiply with coorX and coorZ)

  for (int i=0; i<numPointsW ;i++) {  // For all the points around the width
    float thetaW=i*2*PI/(numPointsW-1);
    coorX[i]=sin(thetaW);
    coorZ[i]=cos(thetaW);
  }
  
  for (int i=0; i<numPointsH; i++) {  // For all points from top to bottom
    if (PApplet.parseInt(numPointsH_2pi/2) != (float)numPointsH_2pi/2 && i==numPointsH-1) {  // If the numPointsH_2pi is odd and it is at the last pt
      float thetaH=(i-1)*2*PI/(numPointsH_2pi);
      coorY[i]=cos(PI+thetaH); 
      multXZ[i]=0;
    } 
    else {
      //The numPointsH_2pi and 2 below allows there to be a flat bottom if the numPointsH is odd
      float thetaH=i*2*PI/(numPointsH_2pi);

      //PI+ below makes the top always the point instead of the bottom.
      coorY[i]=cos(PI+thetaH); 
      multXZ[i]=sin(thetaH);
    }
  }
}

public void textureSphere(float rx, float ry, float rz, PImage t) { 
  // These are so we can map certain parts of the image on to the shape 
  float changeU=t.width/(float)(numPointsW-1); 
  float changeV=t.height/(float)(numPointsH-1); 
  float u=0;  // Width variable for the texture
  float v=0;  // Height variable for the texture

  beginShape(TRIANGLE_STRIP);
  texture(t);
  for (int i=0; i<(numPointsH-1); i++) {  // For all the rings but top and bottom
    // Goes into the array here instead of loop to save time
    float coory=coorY[i];
    float cooryPlus=coorY[i+1];

    float multxz=multXZ[i];
    float multxzPlus=multXZ[i+1];

    for (int j=0; j<numPointsW; j++) {  // For all the pts in the ring
      normal(coorX[j]*multxz, coory, coorZ[j]*multxz);
      vertex(coorX[j]*multxz*rx, coory*ry, coorZ[j]*multxz*rz, u, v);
      normal(coorX[j]*multxzPlus, cooryPlus, coorZ[j]*multxzPlus);
      vertex(coorX[j]*multxzPlus*rx, cooryPlus*ry, coorZ[j]*multxzPlus*rz, u, v+changeV);
      u+=changeU;
    }
    v+=changeV;
    u=0;
  }
  endShape();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Shears_Simulator" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

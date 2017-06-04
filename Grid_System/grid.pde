int mapsize = 1000;
int gridsize = 100;

float angle;

void grid() {
  stroke(255);
  smooth();
  lights();
  sphere(5);
  
  if (gridactivate == 1) {
    for(int i = -mapsize; i < mapsize; i=i+gridsize) {
      line(-mapsize,i,0,mapsize,i,0);
      line(i,-mapsize,0,i,mapsize,0);
      line(i,0,-mapsize,i,0,mapsize);
      line(-mapsize,0,i,mapsize,0,i);
    }
  }
}




float viewX,viewY,viewZ,camX,camY,camZ,radius;
float pRotate,vRotate,fRotate;

void camera() {
  
  position.add(velocity);
  velocity.add(acceleration);
  if (velocity.x > 0 && acceleration.x >= 0) friction.x = +0.1; else
  if (velocity.x < 0 && acceleration.x <= 0) friction.x = -0.1; else friction.x = 0;
  if (velocity.z > 0 && acceleration.z >= 0) friction.z = +0.1; else
  if (velocity.z < 0 && acceleration.z <= 0) friction.z = -0.1; else friction.z = 0;
  
  velocity.sub(friction);
  
 
  pRotate = pRotate + vRotate;
  fRotate = -vRotate/10;
  vRotate = vRotate + fRotate;
  
  radius = 300;
  camX = -sin(radians(pRotate*2))*radius+position.x;
  camY = -(mouseY-height/2)+position.y;
  camZ = cos(radians(pRotate*2))*radius+position.z;
  viewX = position.x;
  viewY = position.y;
  viewZ = position.z;
  
  angle = radians(pRotate);
  
  camera(camX, camY, camZ, viewX, viewY, viewZ, 0, 1, 0);
  println(angle);
  
  pushMatrix();
  translate(viewX,viewY,viewZ);
  sphere(10);
  popMatrix();
  
}

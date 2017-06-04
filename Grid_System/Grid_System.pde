PVector position,velocity,friction,acceleration;

void setup() {
  size(800,600,P3D);
  position = new PVector(0,0,0);
  velocity = new PVector(0,0,0);
  friction = new PVector(0,0,0);
  acceleration = new PVector(0,0,0);

}

void draw() {
  background(0);
  grid();
  camera();
  


  
}

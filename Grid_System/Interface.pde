int gridactivate = 0;
int cameramode = 0;

void keyPressed() {
  //Settings
  if (key == 'g') {
    switch(gridactivate) {
      case 0:
        gridactivate = 1;
        println("grid activated");
        break;
      case 1:
        gridactivate = 0;
        println("grid deactivated");
        break;
      default:
        println("something is wrong");
        break;
    }
  }
  
  if (key == 'c') {
    switch(cameramode) {
      case 0:
        cameramode = 1;
        println("Pan Camera");
        break;
      case 1:
        cameramode = 2;
        println("Free move Camera");
        break;
      case 2:
        cameramode = 0;
        println("Centered Camera");
        break;
    }
  }
  

  
  //arrow keys
  float speed = 0.5;
  if (key == 'a') {
    println("Left");
    acceleration.x = acceleration.x - speed*cos(angle*2);
    acceleration.z = acceleration.x - speed*sin(angle*2);
  }
  if (key == 'd') {
    println("Right");
    acceleration.x = acceleration.x + speed*cos(angle*2);
    acceleration.z = acceleration.z + speed*sin(angle*2);
  }
  if (key == 'w') {
    println("Up");
    acceleration.x = acceleration.x + speed*sin(angle*2);
    acceleration.z = acceleration.z - speed*cos(angle*2);
  }
  if (key == 's') {
    println("Down");
    acceleration.x = acceleration.x - speed*sin(angle*2);
    acceleration.z = acceleration.z + speed*cos(angle*2);
  }
  if (keyCode == LEFT) {
    vRotate = vRotate - 0.3;
    
  }
  if (keyCode == RIGHT) {
    vRotate = vRotate + 0.3;
  }
  if (key == 'm') {
    pRotate = 0;
  }
}

void keyReleased() {
  if (key == 'a') {
    acceleration.x = 0;
    acceleration.z = 0;
  }
  if (key == 'd') {
    acceleration.x = 0;
    acceleration.z = 0;
  }
  if (key == 'w') {
    acceleration.x = 0;
    acceleration.z = 0;
  }
  if (key == 's') {
    acceleration.x = 0;
    acceleration.z = 0;
  }
}

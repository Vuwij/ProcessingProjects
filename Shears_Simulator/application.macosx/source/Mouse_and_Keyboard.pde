void keyPressed() {
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
      acceleration.x = -0.2;
      break;
    case DOWN:
      acceleration.x = 0.2;
      break;
    case LEFT:
      acceleration.y = 0.1;
      break;
    case RIGHT:
      acceleration.y = -0.1;
      break;
  }
}

void keyReleased() {
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

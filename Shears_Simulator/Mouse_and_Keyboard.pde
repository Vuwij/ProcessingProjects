void keyPressed() {
  switch(key) {
    case ' ':
      switch(cameraMode) {
        case 0:
          cameraMode = 1;
          break;
        case 1:
          cameraMode = 2;
          break;
        case 2:
          cameraMode = 0;
          break;
      }
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

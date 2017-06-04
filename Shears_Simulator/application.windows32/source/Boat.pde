void boat() {
  
  if(velocity.mag() != 0 && abs(velocity.x) > 0.5) {
    angle += acceleration.y/velocity.mag();
  } else if (abs(velocity.x) < 0.5 && abs(acceleration.y) > 0.05) {
    if(acceleration.y > 0) {
      angle += 0.05;
    } else {
      angle -= 0.05;
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
      velocity.x -= 0.1;
    } else {
      velocity.x += 0.1;
    }
  }
  if(acceleration.y == 0) {
    if(velocity.y > 0) {
      velocity.y -= 0.1;
    } else {
      velocity.y += 0.1;
    }
  }
}


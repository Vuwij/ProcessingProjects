void drawbackground() {
  
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

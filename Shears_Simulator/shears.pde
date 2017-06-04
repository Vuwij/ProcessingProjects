void shears() {
  rotateX(PI);
  translate(-(mouseX-width/2)/5,35+(mouseY-height)/10,70);
  rotateY(PI/2);
  shape(Lshear, 0, 0);
  shape(Rshear, 0, 0);
}

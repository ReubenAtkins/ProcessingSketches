void setup() {
  size(400, 400);
  background(0);
  
}
void draw() {
  background(0);
  pushMatrix();
  translate(.5*height, .5*width);
  for(int i = 0; i < 18; i++) {
    for(int j = 0; j < 18; j++) {
    pushMatrix();
   // fill(i*10, j*10, 170);
    rotate(random(3.14));
      //translate(150*cos(radians(frameCount))+i*40, 150*sin(radians(frameCount))+j*30);
      ellipse(0,0,50,50);
    popMatrix();
    }
  }
  
  
  popMatrix();
  
}
float offSet;
float x1, x2, y1, y2;
int halfCirc = 180;
void setup() {
  size(600, 600);
  offSet = 0;
  blendMode(DIFFERENCE);
}

void draw() {
  //background(255);
  strokeWeight(2);
  stroke(1, 155);
  pushMatrix();

 // translate(.5*width, .5*height);
  for(int i = -1; i < 100; i++) {
     calcPts(i+offSet);
     line(x1, y1, x2, y2);
  //   println(x1+" "+x2+" "+y1+" "+y2);
  }
  offSet+=.1;
 // point(x1, y1);
  popMatrix();
 // frameRate(15);

}
void calcPts(float j) {
  x1 = width/2+sin(radians(frameCount*.15+j*6))*width/2;
  y1 = 350+cos(radians(frameCount*.15+j*6))*350;
  x2 = width/2+sin(radians(frameCount*.15+j*3))*width/2;
  y2 = 350+cos(radians(frameCount*.15+j*3))*200;
}
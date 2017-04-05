float rScl = 1;
void setup() {
 size(600, 600);
 background(0);
 rectMode(CENTER);
  
}


void draw() {
  pushMatrix();
  translate(.5*width, .5*height);
  for(int i = 0; i < 12; i++) {
    pushMatrix();
      float circle1X=200*rScl*sin(radians(frameCount*.1+i*30));
      float circle1Y=200*rScl*cos(radians(frameCount*.1+i*30));
      translate(circle1X, circle1Y);
      rotate(radians(frameCount+i*30));
      //fill(map(millis()%1200, 0, 1200, 0, 255));
      rect(0, 0, 30, 30);
      
      
    for(int j = 0; j < 6; j++) {
      float smallX = 60*sin(radians(frameCount*.5+j*60));
      float smallY = 60*cos(radians(frameCount*.5+j*60));
      ellipse(smallX, smallY, 15, 15);
    }
    popMatrix();  
  }
  popMatrix();
  
}
float rScl = 1;
void setup() {
 size(700, 700);
 background(0);
 rectMode(CENTER);
 noStroke();
  
}


void draw() {
 // background(0);
 fill(1, 25);
 rect(.5*width, .5*height, 700, 700);
 fill(255);
 
  pushMatrix();
  translate(.5*width, .5*height);
  for(int i = 0; i < 8; i++) {
    pushMatrix();
      float circle1X=250*rScl*sin(radians(frameCount*.1+i*45));
      float circle1Y=250*rScl*cos(radians(frameCount*.1+i*45));
      translate(circle1X, circle1Y);
      rotate(radians(frameCount+i*30));
      //fill(map(millis()%1200, 0, 1200, 0, 255));
      rect(0, 0, 30, 30);
      
      
    for(int j = 0; j < 6; j++) {
      float smallX = 60*sin(radians(frameCount+j*60));
      float smallY = 60*cos(radians(frameCount+j*60));
      ellipse(smallX, smallY, 15, 15);
      pushMatrix();
      translate(smallX, smallY);
      for(int k = 0; k < 3; k++) {
        float smallerX = 20*sin(radians(frameCount*2.5+k*120));
        float smallerY = 20*cos(radians(frameCount*2.5+k*120));
        switch(k) {
          case 0: 
          fill(0, 0, 255);
          break;
          case 1:
          fill(255, 0, 0);
          break;
          case 2:
          fill(0, 255, 0);
          break;
        }
        triangle(smallerX, smallerY+8, smallerX-5, smallerY, smallerX+5, smallerY);
        fill(255);

      }
      popMatrix();
    }
    popMatrix();  
  }
  popMatrix();
  
}
void triangleCreator(float x, float y) {

  
  
}
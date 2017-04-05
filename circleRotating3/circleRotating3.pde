void setup() {
  size(600, 600);
  background(0);
  noStroke();
  
}
void draw() {
  background(0);
 
  for(int i = 0; i < 15; i++) {
    fill(255);
    for(int r = 105; r < width/2; r+=30) {
      float x1 = r*sin(radians(frameCount+i*24));
      float y1 = r*cos(radians(frameCount+i*24));
      pushMatrix();
      translate(width/2, height/2);
      ellipse(x1, y1, 15, 15);
      
      for(int k = 0; k < 5; k++) {
      pushMatrix();
      translate(x1, y1);
      ellipse(15*sin(radians(frameCount+k*72*3)), 15*cos(radians(frameCount+k*72*3)), 5, 5);
      popMatrix();
      }
      popMatrix();
    }
  }
  
}
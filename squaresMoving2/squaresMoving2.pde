void setup() {
  size(600, 600, P3D);
  
}
boolean saving = false;
int counter = 0;
void draw() {
  background(0);
  pushMatrix();
  translate(.5*width, .4*height, 0);
  for (int i = 0; i < 200; i+=5) { 
    for (int j = 0; j < 200; j+=5) {
      pushMatrix();
      translate(200-j, 200-i);
      fill((mouseX*4+4*i)%255, (mouseY*4+4*j)%255, map(noise(frameCount*.001), 0, 1, 0, 255));
      box(5, 5, 10);
      rotateY(radians(frameCount));
      rotateX(radians(frameCount));      
      popMatrix();      
      rotateY(radians(frameCount*.004));
    }    
  }
  popMatrix();
 /** if (saving == true) {
    saveFrame();
    counter++;
  }
  if (counter == 300) {
    saving = false;
  }
  
  **/

  
}
void mousePressed() {
  saving = true;
}
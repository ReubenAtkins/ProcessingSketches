void setup() {
  size(400, 400, P3D);
  background(0);

}
/*void mouseReleased() {
  saveFrame();
}
*/

void draw() {
  background(0);
  if(mousePressed) {
   camera(width/2.0, mouseY*2, (height/2.0) / tan(PI*30.0 / 180.0),
   width/2.0, height/2.0, 0,
   0, 1, 0);
  }
  for (int i = 0; i < width; i+=15) {
    
    for(int j = 0; j < height*1.5; j+=15) {
      pushMatrix();
      if(random(3) < 1.5) {
      translate(i, height/2, -j);
      box(10);
      }
      
      popMatrix();
    }
    
  }

  
}
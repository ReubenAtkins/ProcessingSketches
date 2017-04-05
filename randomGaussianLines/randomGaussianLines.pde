void setup() {
  size(400, 400);
  background(0);
}
void draw() {
  if(mousePressed == false) {
  background(255);
 
    ellipse(mouseX, mouseY, 30, 30);
    for(int i = 0; i < width; i++) {
      fill(255);
      line(i, .5*height, i, .5*height+randomGaussian()*10);
      
    }
  }
}
float dist = 4, radius = dist/2, alpha = 0, speed = 25;
float px, py, x, y, k;
int location;

PImage img;
void setup() {
  size(1200, 700);
  img = loadImage("4.jpg");
  img.resize(width, height*(img.height/img.width));
  background(0);
  stroke(255);
  smooth();
 // frameRate(1);
 
  frameRate(240);
  px = radius;
  py = 0;
  loadPixels();
}

void draw() {
  /*
  println(frameCount);
  if(frameCount % 50 == 0) {
    saveFrame();
  }
 */
 for(int i = 0; i < 20; i++) {
  k = speed/radius;
  alpha += k;

  radius += dist/(360/k);
  //println(alpha);
  x = radius*cos(radians(alpha));
  y = -radius*sin(radians(alpha));
  pushMatrix();
  translate(width/2, height/2);
  location = floor(x+width/2)+floor(y+height/2)*img.width;
  if(location < img.pixels.length && location > -1) {
    //println(brightness(img.pixels[location]));
  float temp = map(brightness(img.pixels[location]), 0, 255, .2, 3);
  strokeWeight(temp);
  line(px, py, x, y);
  px = x;
  py = y;
  
    }
 popMatrix();
 }
 
  keyed();
}
void keyed() {
  if (keyPressed) {
    if (key == 'v'||key=='V') {
      saveFrame();
    }
  }
  
}
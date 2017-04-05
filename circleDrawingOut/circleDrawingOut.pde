float dist = 4, radius = dist/2, alpha = 0, speed = 500;
float px, py, x, y, k;

PImage img;
void setup() {
  size(600, 600);
  img = loadImage("1.jpg");
  img.resize(width, height*(img.height/img.width));
  background(0);
  stroke(255);
  smooth();
  frameRate(120);
  px = radius;
  py = 0;
}

void draw() {
  k = speed/radius;
  alpha += k;

  radius += dist/(360/k);
  x = radius*cos(radians(alpha));
  y = -radius*sin(radians(alpha));
  translate(width/2, height/2);
  
  line(px, py, x, y);
  px = x;
  py = y;
}
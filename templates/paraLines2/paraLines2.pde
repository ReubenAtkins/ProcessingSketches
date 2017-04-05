float spacing = 5; // change this
float strwidth = 1; // and this for different results
float x = 0;
float y = 0;
float xx = x;
float yy = y;
float xend = 800; // change this
float yend = 450; // and this to experiment
float xspacing = spacing;
float yspacing = spacing;

void setup() {
  size(800, 450); // matches xend and yend for best results
  background(255, 255, 255);
  stroke(255, 255, 255);
  blendMode(DIFFERENCE);
  strokeWeight(strwidth);
}

void draw() {
  line(x, y, xend, y);
  line(xend, y, xend, yend);
  line(xend, yend, x+xspacing, yend);
  line(x+xspacing, yend, x+xspacing, y+yspacing);
  //saveFrame("line-#######.png");
  x=x+xspacing;
  y=y+yspacing;
  xend=xend-xspacing;
  yend=yend-yspacing;

  if (x > width) {
    xspacing = xspacing - (spacing*2);
  }

  if (x < 0) {
    xspacing = xspacing + (spacing*2);
  }

  if (y > height) {
    yspacing = yspacing - (spacing*2);
  }
  if (y < 0) {
    yspacing = yspacing + (spacing*2);
  }
}
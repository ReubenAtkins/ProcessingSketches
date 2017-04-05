class Bubbles {
  float x;
  float y;
  float xChange;
  float yChange;
  color c = color(255);
  
  Bubbles(int r1, int r2) {
    x = r1;
    y = r2;
    xChange = random(-5, 5);
    yChange = random(-5, 5);
    
    
  }
  void display() {
    ellipse(x, y, 20, 20);
  }
boolean bounce = true;
  void update() {
    fill(c);
    x += xChange;
    y += yChange;
    if(x <= 0 || y <= 0 || x >= width || y >= height && bounce == true) {
      xChange *= -1;
      yChange *= -1;
      bounce = false;
    }
      bounce = true;
    
  }
  void collision(Bubbles bub) {
    if(dist(x, y, bub.x, bub.y) < 25 && bounce == true) {
      bub.xChange*=-1;
      xChange*=-1;
      bounce = false;
    }
    bounce = true;
  }
  void mouseOver(float r, float r2) {
    if (dist(x, y, r, r2) < 20) {
     c = color(0, 180, 190);
     lives -= 1;
    }
    
  }
  
  
  
  
  
}
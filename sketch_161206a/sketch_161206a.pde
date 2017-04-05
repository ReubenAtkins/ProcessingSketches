sq s;
void setup() {
  size(400, 400);
  s = new sq();
  
}

void draw() {
  background(0);
  ellipse(200, 200, 50, 50);
  s.display();
  s.update();
  
}
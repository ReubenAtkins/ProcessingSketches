//particle template
particleController p1;
void setup() {
  size(400, 400);
  background(0);
  p1 = new particleController();
  
}

void draw() {
  background(0);
  p1.display();
  
  
}
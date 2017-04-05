starSystem star;
void setup() {
  size(450, 450);
  frameRate(30);
  star = new starSystem();
}
boolean saving = false;
int a = 0;
void draw() {
  background(0);
  star.display(); 
}
float dist = 40, radius = dist/2, alpha = 0, speed = 500;
float px, py, x, y, k;
void setup() {
  size(640, 640);
  background(255); 
  //fill(0);
  smooth();
  px = radius;
  py = 0;
}
void draw() {
  

smooth();
translate(width/2,height/2);
strokeWeight(2);
beginShape();
rotate(radians(frameCount*18));
for(int j = 0; j < 3; j++) {
  rotate(radians(radians(30*j)));
for(int i=0;i<350;i++)
{
  curveVertex((i*2)*sin(i/5.0),(i*2)*cos(i/5.0));
}
}
endShape(); 
}
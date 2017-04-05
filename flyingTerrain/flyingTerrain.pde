int cols, rows;
int scl = 20;
int w = 1200;
int h = 1600;
float flying = 0;
float[][] terrain;


void setup() {
 size(600, 600, P3D); 

 cols = w / scl;
 rows = h/scl;
// frameRate(1);
 terrain = new float[cols][rows];


}
void draw() {
  flying -= .1;
   float yoff = 0+flying;
   for (int y = 0; y < rows; y++) {
   float xoff = 0;
   for (int x = 0; x < cols; x++) {
     terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
     xoff+=0.1;
     
     
   }
   yoff+=.1;
   
 }
  background(0);
     //stroke(255);
     noStroke();
     translate(width/2, height/2);
     rotateX(PI/3.5);
     translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      fill(map(terrain[x][y], -100, 100, 0, 255),0,map(terrain[x][y], -100, 100, 255, 0));
   
     vertex(x*scl, y*scl, terrain[x][y]);
   //  fill(map(terrain[x][y+1], -100, 100, 0, 255),0,0);
     vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
     xoff+=.1;
     
     
     
   }
   endShape();
    
    
    
  }
  
  
  
}
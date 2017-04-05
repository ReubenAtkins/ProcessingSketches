int scl = 10;
int w,h;
float zoff = 0;
float yoff = 0;
float flowfield[][];
PVector flowvects[][];
void setup() {
  size(600, 600);
  background(0);
  frameRate(60);
  w = width/scl;
  h = height/scl;
  flowfield = new float[w][h];
  flowvects = new PVector[w][h];
  noStroke();
    
  
}
void draw() {
 //background(255);
  for(int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      flowfield[x][y] = map(noise(x*.1, y*.1, zoff), 0, 1, -2*PI, 2*PI);
      
      PVector temp = PVector.fromAngle(flowfield[x][y]);
      temp.setMag(map(noise(x*.1, y*.1, yoff), .1, .9, 0, 285));
      flowvects[x][y] = temp;
      // stroke(255);
      // line(x*scl+.5*scl, y*scl+.5*scl, x*scl+.5*scl+temp.x, y*scl+.5*scl+temp.y);
      // ellipse(x*scl+.5*scl, y*scl+.5*scl, 5, 5);
    }
  }

  for(int i = 0; i < 3000; i++) {
    float x1 = random(width);
    float y1 = random(height);
    int xloc = floor(x1/scl);
    int yloc = floor(y1/scl);
    fill(flowvects[xloc][yloc].mag());
    if(flowvects[xloc][yloc].mag() < 150) {
      fill(1, 15);
    }
   // fill(flowvects[xloc][yloc].mag(), map(flowvects[xloc][yloc].x, -200, 200, 0, 255),map(flowvects[xloc][yloc].y, -200, 200, 255, 0), 150 );
    ellipse(x1, y1, 7, 7);
  }
  yoff+=.03;
  zoff+=.01;
  
  
}
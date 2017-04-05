ArrayList<Particle> particles;
int w, h;
int scl = 20;
float flowfield[][];
void setup() {
  size(600, 600);
  particles = new ArrayList<Particle>();
 
  background(255);
  w = width/scl;
  h = height/scl;
  flowfield = new float[w][h];
 
 
  for (int i = 0; i < 3000; i++) {
    particles.add(new Particle());
    
    }
}

void draw() {
  for (int x = 0; x < w; x++) {
    
    for (int y = 0; y < h; y++) {
      flowfield[x][y] = map(noise(x*.1, y*.1), 0, 1, 0, 2*PI);
      PVector temp = PVector.fromAngle(flowfield[x][y]);
      line(20*x, 20*y, 20*x+temp.x*10, 20*y+temp.y*10);
      
      
    }
    
    
  }
  
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();
        
  }
  
  
  
}
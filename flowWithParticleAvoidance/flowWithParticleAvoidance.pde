ArrayList<Particle> particles;
int w, h;
int scl = 20;
float flowfield[][];
float zoff = 0;
int ParticleAmount = 3000;
void setup() {
  size(1400, 800);
  particles = new ArrayList<Particle>();
 
  background(255);
  w = width/scl;
  h = height/scl;
  flowfield = new float[w][h];

 
  for (int i = 0; i < ParticleAmount; i++) {
    particles.add(new Particle());
    
    }  
}

void draw() {
 // background(255, 5);
    //fill(0);
  //textSize(32);
 //text(mouseX +" "+ mouseY, width/2, height/2);
 //fill(01, 5);
  for (int x = 0; x < w; x++) {
    
    for (int y = 0; y < h; y++) {
      flowfield[x][y] = map(noise(x*.1, y*.1, zoff), 0, 1, -2*PI, 2*PI);
      PVector temp = PVector.fromAngle(flowfield[x][y]);
      
      //drawing the vectors to see them:
     // line(20*x, 20*y, 20*x+temp.x*10, 20*y+temp.y*10);
      
      
    }
    
    
  }
  //zoff representing increments in time
  zoff+=.025;
  //placement of random particles into map
  //fill(1, 5);
   for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update(flowfield);
      p.display();
        
  }
  
  if (keyPressed == true) {
    if(key == 'v' || key == 'V') {
      saveFrame();
    }
    
  }
  
  
}
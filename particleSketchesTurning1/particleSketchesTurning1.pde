PImage img;
ArrayList<particles> p;
void setup() {
  size(600, 400);
  img = loadImage("1.jpg");
  img.resize(width, height*(img.height/img.width));
  p = new ArrayList<particles>();
  ellipseMode(CENTER);
  img.loadPixels();
  background(255);
   for(int i = 0; i < 30000; i++) {
  p.add(new particles());
 }
}

void draw() {
//  image(img, 0, 0);
 // println(img.width +" "+img.height);

 noStroke();
  for(int i = p.size()-1; i >= 0; i--) {
    particles t = p.get(i);
    t.update();
    color temp = img.pixels[t.location()];
    stroke(temp,2);
    t.display();
    
   // p.remove(i);
    
  }
  keyed();
  
}
void keyed() {
  if (keyPressed) {
    if (key == 'v'||key=='V') {
      saveFrame();
    }
  }
  
}
class particles {
  int location;
  PVector vel, loc, accel, ploc;
  particles() {
    loc = new PVector (.5*width+randomGaussian()*100, .5*height+randomGaussian()*100);
    ploc = loc.copy();
    vel = PVector.random2D();
    accel = PVector.random2D().mult(.1);
    edges();
    
    
  }
  void update() {
    ploc = loc.copy();
    vel.add(accel);
    loc.add(vel);
    edges();
  }
  void display() {
    line(ploc.x, ploc.y, loc.x, loc.y);
      
    
  }
  int location() {
    
    return(int)(floor(loc.x) + floor(loc.y)*width);
    
    }
  void edges() {
    while(loc.x > width || loc.x < 0) {
      loc.x = .5*width+randomGaussian()*100;
      vel = PVector.random2D();
      accel = PVector.random2D().mult(.1);
     }

    while(loc.y < 0 || loc.y > height) {
      loc.y = .5*height+randomGaussian()*100;
      vel = PVector.random2D();
      accel = PVector.random2D().mult(.1);
    }
    
    
  }
  
  
}
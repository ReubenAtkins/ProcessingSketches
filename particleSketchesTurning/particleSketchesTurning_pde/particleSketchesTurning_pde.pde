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
}

void draw() {
//  image(img, 0, 0);
 // println(img.width +" "+img.height);
 for(int i = 0; i < 3; i++) {
  p.add(new particles());
 }
 noStroke();
  for(int i = p.size()-1; i >= 0; i--) {
    particles t = p.get(i);
    color temp = img.pixels[t.location()];
    fill(temp);
    t.update();
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
  PVector vel, loc, accel;
  particles() {
    loc = new PVector (.5*width+randomGaussian()*100, .5*height+randomGaussian()*100);
    vel = PVector.random2D();
    accel = PVector.random2D().mult(.1);
    edges();
    
    
  }
  void update() {
    loc.add(vel);
    vel.add(accel);
    ellipse(loc.x, loc.y, 1.5, 1.5);
    edges();
    
    
  }
  int location() {
    
    return(int)(floor(loc.x) + floor(loc.y)*width);
    
  }
  void edges() {
    while(loc.x > width || loc.x < 1) {
      loc.x = .5*width+randomGaussian()*100;
      
    }

    while(loc.y < 1 || loc.y > height) {
      loc.y = .5*height+randomGaussian()*100;
    }
    
    
  }
  
  
}
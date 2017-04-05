PImage img;
ArrayList<particles> p;
void setup() {
  size(600, 400);
  img = loadImage("1.jpg");
  img.resize(width, height*(img.height/img.width));
  p = new ArrayList<particles>();
  ellipseMode(CENTER);
  img.loadPixels();
}

void draw() {
//  image(img, 0, 0);
 // println(img.width +" "+img.height);
 for(int i = 0; i < 30; i++) {
  p.add(new particles());
 }
 noStroke();
  for(int i = p.size()-1; i >= 0; i--) {
    particles t = p.get(i);
    color temp = img.pixels[t.location()];
    fill(temp, 30);
    t.update();
    p.remove(i);
    
  }
  
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
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    edges();
    
    
  }
  void update() {
    ellipse(loc.x, loc.y, 1.5, 1.5);
    edges();
    
    
  }
  int location() {
    
    return(int)(floor(loc.x) + floor(loc.y)*width);
    
  }
  void edges() {
    if(loc.x < 1) {
      loc.x = width-1;
      
    }
    if(loc.x > width) {
      loc.x = 1;
      
    }
    if (loc.y > height) {
      loc.y = 1;
      
    }
    if(loc.y < 1) {
      loc.y = height-1;
    }
    
    
  }
  
  
}
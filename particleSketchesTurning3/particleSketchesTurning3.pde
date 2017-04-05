PImage img;
ArrayList<particles> p;
void setup() {
  size(600, 400);
  img = loadImage("1.jpg");
  img.resize(width, height*(img.height/img.width));
  p = new ArrayList<particles>();
  ellipseMode(CENTER);
  img.loadPixels();
  background(15);
   for(int i = 0; i < 2500; i++) {
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
   if(t.location() < img.pixels.length-1 && t.location() > 0) {
    color temp = img.pixels[t.location()];
    //color(1);
    stroke(temp, 50);
    //println(t.location());
    t.display();
    }
    
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
  PVector vel, loc, accel, ploc, centNorm;
  particles() {
    loc = new PVector (.5*width+randomGaussian()*40, .5*height+randomGaussian()*20);
    ploc = loc.copy();
    vel = PVector.random2D().mult(2);
    accel = PVector.random2D().mult(.2);
    
    edges();
    
    
  }
  void update() {
    centNorm = new PVector(width/2-loc.x, height/2-loc.y);
    centNorm.normalize();

    float temp = PVector.angleBetween(centNorm, accel);
        //println(vel.x+" "+vel.y);
   // println(temp);
    ploc = loc.copy();
    //vel = 
    accel.lerp(centNorm, .1).mult(.1);
    vel.add(accel).limit(3);
    loc.add(vel);
    edges();
  }
  void display() {
    line(ploc.x, ploc.y, loc.x, loc.y);
   }
  int location() {
     int temp = floor(loc.x)+floor(loc.y)*width;
     return temp;
    }
  void edges() {
    /*
    if(dist(loc.x, loc.y, width/2, height/2) > 90) {
      vel.mult(random(-.9, -1.1));
      
    }
    */
    
    
    /*
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
    */
    
    
    
  }
  
  
}
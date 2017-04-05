class Particle {
  PVector loc, accel, veloc, ploc;
  int scl = 20;
  color c;

  Particle() {
    loc = new PVector(random(width), random(height));
    accel = new PVector(0, 0);
    veloc = new PVector(0, 0);
    c = color(random(255), random(255), random(255), 5);
  }
  void display() {
    strokeWeight(3);
    stroke(c);
    //fill(1, 5);
   // point(loc.x, loc.y);
    line(ploc.x, ploc.y, loc.x, loc.y);
    
  }
  void update(float[][] field) {
          if( loc.x < 0) {
        loc.x = width-1;
        update();
        
       }
       if(loc.x > width) {
         loc.x = 1;
         update();
       }
       if (loc.y < 0) {
         loc.y = height-1;
         update();
       }
       if(loc.y > height){
         loc.y = 1;
         update();
        }
    ploc = loc.copy();
    int x = floor(loc.x/scl);
    int y = floor(loc.y/scl);
    if (loc.x > 0 && loc.x < width && loc.y < height && loc.y > 0 ) {
      float temp1 = noise(frameCount*.07+300);
    c = color(map(noise(loc.y*.01+frameCount*.005), 0, 1, 0, 255), 
              map(noise(loc.x*.01+frameCount*.005), 0, 1, 0, 255), 
              map(temp1, 0, 1, 255, 0), 
              45); 
    
      accel.add(PVector.fromAngle(flowfield[x][y]).setMag(.5));
      veloc.add(accel).limit(7);
      loc.add(veloc);
    //  veloc.limit(.3);
    }

    
    accel.mult(0);
  }
  void update() {
    ploc = loc;
    
  }
  
  
}
class Particle {
  PVector loc, accel, veloc, ploc;
  int scl = 20;

  Particle() {
    loc = new PVector(random(width), random(height));
    accel = new PVector(0, 0);
    veloc = new PVector(0, 0);
  }
  void display() {
    stroke(1, 5);
    //fill(1, 5);
   // point(loc.x, loc.y);
    line(ploc.x, ploc.y, loc.x, loc.y);
    
  }
  void update(float[][] field) {
    ploc = loc.copy();
    int x = floor(loc.x/scl);
    int y = floor(loc.y/scl);
    if (loc.x > 0 && loc.x < width && loc.y < height && loc.y > 0 ) {
      accel.add(PVector.fromAngle(flowfield[x][y]).setMag(.5));
      veloc.add(accel).limit(7);
      loc.add(veloc);
    //  veloc.limit(.3);
    }
      if( loc.x < 0) {
        loc.x = width-1;
        update();
        
       }
       if(loc.x > width) {
         loc.x = 1;
         update();
       }
       if (loc.y < 20) {
         loc.y = height-1;
         update();
       }
       if(loc.y > height){
         loc.y = 1;
         update();
        }
    
    accel.mult(0);
  }
  void update() {
    ploc = loc;
    
  }
  
  
}
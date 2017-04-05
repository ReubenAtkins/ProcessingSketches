class Particle {
  PVector loc, accel, veloc, ploc;
  int scl = 20;
  int strokeLen;
  color c;

  Particle() {
    loc = new PVector(random(width), random(height));
    accel = new PVector(0, 0);
    veloc = new PVector(0, 0);
   // c = color(random(255), random(255), random(255), 5);
    strokeLen = (int)random(2, 8);
  }
  void display() {
    strokeWeight(strokeLen);
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
      float temp1 = veloc.normalize().x;
      float temp2 = accel.normalize().y;
      float temp3 = veloc.normalize().x;
      
    c = color(
    //0,
              map(noise(frameCount*.01), 0, 1, 0, 255), 
              map(temp1, -.75, .75, 255, 0),
              map(temp3, -.75, .75, 255, 0),
              
              
              
              
               
              
              15); 
              //println(temp1);
    
      accel.add(PVector.fromAngle(flowfield[x][y]).setMag(.5));
      veloc.add(accel).limit(3);
      loc.add(veloc);
    //  veloc.limit(.3);
    }

    
    accel.mult(0);
  }
  void update() {
    ploc = loc;
    
  }
  
  
}
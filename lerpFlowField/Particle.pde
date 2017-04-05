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
    strokeWeight(2);
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

    
      accel.add(PVector.fromAngle(flowfield[x][y]));
      accel.mult(3);
            float temp1 = veloc.x;
      float temp2 = accel.y;
      float temp3 = accel.x;
      color previous = c;
      float red = map(temp2*random(.9, 1), -3, 1, 0, 255);
      float blue = map(temp2*random(.9,1), -1, 3, 0, 255);
      float green = map(temp3*random(.9,1), -3, 3, 0, 255);
      c = color((red+red(previous))/2, 
                  (blue+blue(previous))/2, 
                    (green+green(previous))/2, 
                    15);
      
  /*    
    c = color(
    //0,    
           map(temp2*random(.9, 1), -3, 1, 0, 255), 
            map(temp2*random(.9,1), -1, 3, 0, 255), 
             map(temp3*random(.9,1), -3, 3, 0, 255), 
            
            
             15);
             */
             
             
          // println(String.format("%.10f", temp2));
      //.setMag(.5));
      veloc.add(accel).limit(7);
      loc.add(veloc);
    //  veloc.limit(.3);
    }

  //  println(String.format("%.10f", accel.y)); 
    accel.mult(0);
  }
  void update() {
    ploc = loc;
    
  }
  
  
}
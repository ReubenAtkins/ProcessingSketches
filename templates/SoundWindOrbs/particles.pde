class particles { 
  PVector velocity, acceleration,location;
  float counter;
  float r;
  int fadeIn;
  particles(float x1, float y1, float r1) {
    location = new PVector (x1, y1);
    velocity = new PVector(random(-3, 3), random(-3, 3));
    r = r1;
    acceleration = new PVector(random(-.02, .02), random(-.02, .02));
    fadeIn = 0;
    
    //to implement
    //velocity = new Pvector(0, 1);
    counter = random(0, 360);
    //
    
  }
  void update(PVector wind) {
    counter++;
    fadeIn++;
    acceleration = wind;
    if (counter > 360) {
      fadeIn = 0;
      
      location = new PVector(random(width), random(height));
      velocity = new PVector(random(-.5, .5), random(-.5, .5));
      counter = random(180);
      
      
    }
    velocity.add(acceleration);
    location.add(velocity);
    
    
    
    
  }
  void display() {
    pushMatrix();
    noStroke();
    float temp = map(counter, 0, 340, 255, 0);
    fill(temp, map(counter, 0, 340, 255, 0));
    if(fadeIn < 60) {
      fill(temp, map(fadeIn, 0, 90, 0, map(counter, 0, 340, 255, 0)));
    }
      translate(location.x, location.y);
      ellipse(0, 0, r, r);
    popMatrix();
    
  }
  
  
  
}
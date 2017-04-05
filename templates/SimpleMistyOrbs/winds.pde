class winds {
  PVector velocity, acceleration;
  winds() {
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector (random(-.05, .5), random(-.05, .05));
    
  }
  void update() {
    
  }
  
  
}
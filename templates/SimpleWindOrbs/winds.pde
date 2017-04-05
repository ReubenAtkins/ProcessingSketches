class winds {
  PVector velocity, acceleration;
  winds() {
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector (random(-.05, .05), random(-.05, .05));
    
  }
  PVector update() {
    PVector noiseVal = new PVector(map(noise(mouseX*.02), 0, 1, -.15, .15), 
                                   map(noise(mouseY*.02+180), 0, 1, -.15, .15));
    return noiseVal;
    
  }
  
  PVector getAcceleration() {
    
    return acceleration;
  }
  
  
}
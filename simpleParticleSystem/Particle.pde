class Particle {
  PVector loc, accel, veloc;
  
  Particle() {
    loc = new PVector(random(width), random(height));
    accel = new PVector(0, 0);
    veloc = new PVector(0, 0);
  }
  void display() {
    point(loc.x, loc.y);
    
  }
  void update() {
    
  }
  
  
}
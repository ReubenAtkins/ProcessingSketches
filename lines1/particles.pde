class Particles {
  PVector velocity,acceleration,location;
  PShape s;
  float radii;
  int counter;
  
  Particles(float x1, float y1, float r1) {
    velocity = new PVector(0, 1);
    location = new PVector(x1, y1);
    counter = (int)random(0, 600);
    radii = r1-.5;
    s = createShape();
    s.beginShape();
    s.fill(255);
   // s.stroke(255);
  //  s.strokeWeight(2);
    // Here, we are hardcoding a series of vertices
    s.vertex(0, -50);
    s.vertex(14, -20);
    s.vertex(47, -15);
    s.vertex(23, 7);
    s.vertex(29, 40);
    s.vertex(0, 25);
    s.vertex(-29, 40);
    s.vertex(-23, 7);
    s.vertex(-47, -15);
    s.vertex(-14, -20);
    s.endShape(CLOSE);

    
    
  }
  void go() {
    location.add(velocity);
    shape(s, location.x, location.y, radii, radii*.75);
    if (location.y > height) {
      location.y = -20;
      
    }
    counter++;
    if (counter % 60 < 1) {
      location.y -= 20;
      
    }
    
  }
  
  
  
}
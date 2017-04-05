static winds w;
class particleController {

  
  ArrayList<particles> plist = new ArrayList<particles>();
  particleController() {
    int i = 0;
    w = new winds();
    while(i < 400) {
      plist.add(new particles(random(width), random(height), random(30)));
      i++;
      
    }
    
  }
  void display() {
    PVector wAccel = w.update();
    for(int i = plist.size()-1; i >= 0; i--) {
      particles p = plist.get(i);
      if(p.location.x > width + 30 || p.location.x < -30 || p.location.y > height+30 || p.location.y < -30) {
        plist.remove(i);
        plist.add(new particles(random(-30, width+30), random(-30, height+30), random(30)));
      }else {
      p.update(wAccel);  
      p.display();
      }
      
    }
    
  }
  
  
  
}
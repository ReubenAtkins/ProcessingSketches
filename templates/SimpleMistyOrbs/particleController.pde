class particleController {
  
  ArrayList<particles> plist = new ArrayList<particles>();
  particleController() {
    int i = 0;
    while(i < 400) {
      plist.add(new particles(random(width), random(height), random(30)));
      i++;
      
    }
    
  }
  void display() {
    for(int i = plist.size()-1; i >= 0; i--) {
      particles p = plist.get(i);
      p.update();  
      p.display();
      
    }
    
  }
  
  
  
}